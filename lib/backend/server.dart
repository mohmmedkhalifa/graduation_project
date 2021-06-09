import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:graduation_project/backend/addressProvider.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/sellerProvider.dart';
import 'package:graduation_project/backend/spHelper.dart';
import 'package:graduation_project/models/addressModel.dart';
import 'package:graduation_project/models/messageModel.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/models/sellerModel.dart';
import 'package:graduation_project/models/userModel.dart';
import 'package:provider/provider.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
final String collectionName = 'users';

String chatCollectionName = 'chats';
String messageCollectionName = 'messages';
String usersCollectionName = 'users';

Future<String> registerUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: password);
  return userCredential.user.uid;
}

Future<AppUser> signInUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);

  DocumentSnapshot documentSnapshot = await firestore
      .collection(collectionName)
      .doc(userCredential.user.uid)
      .get();

  Map map = documentSnapshot.data();

  map['userId'] = userCredential.user.uid;

  AppUser appUser = AppUser.newUser(map);
  Repository.repository.appUser = appUser;
  return appUser;
}

String getUserId() {
  String userId =
      firebaseAuth.currentUser != null ? firebaseAuth.currentUser.uid : null;
  return userId;
}

signOut(context) async {
  await firebaseAuth.signOut();
  ExtendedNavigator.of(context).replace(Routes.login);
}

saveUserInFirebase(AppUser appUser, context) async {
  try {
    String userId =
        await registerUsingEmailAndPassword(appUser.email, appUser.password);
    Map map = appUser.toJson();
    map.remove('password');
    bool isSeller = appUser.type == userType.seller;
    if (isSeller) {
      map['logoUrl'] = await uploadImage(
          Provider.of<SellerProvider>(context, listen: false).file);
      await firestore.collection(collectionName).doc(userId).set(map);
      appUser.logoUrl = map['logoUrl'];
      Repository.repository.appUser = appUser;
    } else {
      await firestore.collection(collectionName).doc(userId).set(map);
      Repository.repository.appUser = appUser;
    }
  } on Exception catch (e) {
    print(e.toString());
  }
}

Future<bool> addProductToFireBase(Map map, context) async {
  await firestore.collection('products').doc().set(map);
}

addAddressToFirebase(Map map, context) async {
  await firestore.collection('addresses').doc().set(map);
}



Future<String> uploadImage(File file) async {
  String fileName = file.path.split('/').last;
  String folderName = 'logos';
  Reference reference = storage.ref('$folderName/$fileName');
  await reference.putFile(file);
  String imageUrl = await reference.getDownloadURL();
  return imageUrl;
}

Future<String> uploadProductsImage(File file) async {
  String fileName = file.path.split('/').last;
  String folderName = 'productsImages';
  Reference reference = storage.ref('$folderName/$fileName');
  await reference.putFile(file);
  String imageUrl = await reference.getDownloadURL();
  return imageUrl;
}

Future<List<SellerModel>> getAllSeller(context) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('users')
      .where('isSeller', isEqualTo: true)
      .get();
  List<SellerModel> sellerModel = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['sellerId'] = e.id;
    return SellerModel.fromJson(map);
  }).toList();
  Provider.of<SellerProvider>(context, listen: false).setSellers(sellerModel);

  return sellerModel;
}

autoValidationSeller(context) async {
  List<SellerModel> sellers = await getAllSeller(context);
  for (int i = 0; i < sellers.length; ++i) {
    int sellerAge = int.parse(sellers[i].age);
    int legalAge = DateTime.now().year - sellerAge;
    if (legalAge >= 20) {
      firestore.collection('users').doc(sellers[i].sellerId).update({
        'isActive': true,
      });
    }
  }
}

fetchSplashData(context) async {
  // getAdmin(context);
  getAlUsers();
  getAllProducts(context);
  AppUser appUser = await getUserFromFirebase();
  Repository.repository.appUser = appUser;
  print(appUser.isSeller);
  print(appUser.isActive);
  print(appUser.userName);
  if (appUser.isAdmin ?? false) {
    ExtendedNavigator.of(context).replace(Routes.controlPanel);
  } else if (appUser.isActive && appUser.type == userType.customer ?? false) {
    ExtendedNavigator.of(context).replace(Routes.homeNavigator);
  } else if (appUser.isActive && appUser.type == userType.seller ?? false){
    ExtendedNavigator.of(context).replace(Routes.homeNavigator);
  }
}

Future<AppUser> getUserFromFirebase() async {
  String userId = getUserId();

  DocumentSnapshot documentSnapshot =
      await firestore.collection(collectionName).doc(userId).get();
  Map map = documentSnapshot.data();
  map['userId'] = userId;
  AppUser appUser = AppUser.newUser(map);

  return appUser;
}

blockUser(context, SellerModel seller) async {
  firestore.collection('users').doc(seller.sellerId).update({
    'isActive': false,
  });
}

unblockUser(context, SellerModel seller) async {
  firestore.collection('users').doc(seller.sellerId).update({
    'isActive': true,
  });
}

getAllProducts(context) async {
  QuerySnapshot querySnapshot = await firestore.collection('products').get();
  List<ProductModel> productModel = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['productId'] = e.id;
    return ProductModel.fromJson(map);
  }).toList();

  Provider.of<ProductProvider>(context, listen: false)
      .setAllProducts(productModel);
}

getAllAddresses(context) async {
  QuerySnapshot querySnapshot = await firestore.collection('addresses').get();
  List<AddressModel> addressModel = querySnapshot.docs.map((e) {
    Map map = e.data();
    return AddressModel.fromJson(map);
  }).toList();

  Provider.of<AddressProvider>(context, listen: false).setAddress(addressModel);
}

getAlUsers() async {
  QuerySnapshot querySnapshot = await firestore
      .collection(usersCollectionName)
      .where('isSeller', isEqualTo: true)
      .get();
  List<SellerModel> usersModels =
      querySnapshot.docs.map((e) => SellerModel.fromJson(e.data())).toList();

  Repository.repository.sellers = usersModels;
}

getUserFromSp() {
  AppUser userModel = SPHelper.spHelper.getUser();
  Repository.repository.appUser = userModel;
}

///////////////////////////////////////////////////////
Future<String> createChat(List<String> usersIds) async {
  String chatId = usersIds.reduce((value, element) => value + element);
  await firestore
      .collection(chatCollectionName)
      .doc(chatId)
      .set({'users': usersIds});
  return chatId;
}

///////////////////////////////////////////////////////
createMessage(MessageModel message) async {
  firestore
      .collection(chatCollectionName)
      .doc(message.chatId)
      .collection(messageCollectionName)
      .add(message.toJson());
}

Future<List<Map<String, dynamic>>> getAllChats() async {
  String myId = Repository.repository.appUser.userId;
  QuerySnapshot querySnapshot = await firestore
      .collection(chatCollectionName)
      .where('users', arrayContains: myId)
      .get();
  List<Map<String, dynamic>> chats =
      querySnapshot.docs.map((e) => e.data()).toList();
  return chats;
}

///////////////////////////////////////////////////////
Stream<QuerySnapshot> getChatMessages(String chatId) {
  Stream<QuerySnapshot> stream = firestore
      .collection(chatCollectionName)
      .doc(chatId)
      .collection(messageCollectionName)
      .orderBy('timeStamp')
      .snapshots();
  return stream;
}

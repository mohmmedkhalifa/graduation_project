// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/0splash.dart';
import '../screens/10emptyCart.dart';
import '../screens/11cart.dart';
import '../screens/12payment.dart';
import '../screens/13orderDetails.dart';
import '../screens/14.0chatMessages.dart';
import '../screens/15profile.dart';
import '../screens/16favorite.dart';
import '../screens/17shippingAddress.dart';
import '../screens/18openStore.dart';
import '../screens/19storePage.dart';
import '../screens/20validationProcess.dart';
import '../screens/21addProduct.dart';
import '../screens/22addProductDetails.dart';
import '../screens/23addAddress.dart';
import '../screens/4login.dart';
import '../screens/5.0userType.dart';
import '../screens/5register.dart';
import '../screens/6.0HomeNavigator.dart';
import '../screens/6homePage.dart';
import '../screens/7categories.dart';
import '../screens/8allProducts.dart';
import '../screens/9productDetails.dart';
import '../screens/admin/complaints.dart';
import '../screens/admin/controlPanel.dart';
import '../screens/admin/cp.dart';
import '../screens/admin/members.dart';
import 'productModel.dart';
import 'sellerModel.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/Login';
  static const String register = '/Register';
  static const String homePage = '/home-page';
  static const String categories = '/Categories';
  static const String allProducts = '/all-products';
  static const String productDetails = '/product-details';
  static const String emptyCart = '/empty-cart';
  static const String cart = '/Cart';
  static const String payment = '/Payment';
  static const String orderDetails = '/order-details';
  static const String homeNavigator = '/home-navigator';
  static const String favorite = '/Favorite';
  static const String shippingAddress = '/shipping-address';
  static const String userType = '/user-type';
  static const String openStore = '/open-store';
  static const String storePage = '/store-page';
  static const String validationProcess = '/validation-process';
  static const String profile = '/Profile';
  static const String controlPanel = '/control-panel';
  static const String membersRequests = '/members-requests';
  static const String addProduct = '/add-product';
  static const String addProductDetails = '/add-product-details';
  static const String addAddress = '/add-address';
  static const String chatMessagesPage = '/chat-messages-page';
  static const String controlPanelel = '/control-panelel';
  static const String complaints = '/Complaints';
  static const all = <String>{
    splash,
    login,
    register,
    homePage,
    categories,
    allProducts,
    productDetails,
    emptyCart,
    cart,
    payment,
    orderDetails,
    homeNavigator,
    favorite,
    shippingAddress,
    userType,
    openStore,
    storePage,
    validationProcess,
    profile,
    controlPanel,
    membersRequests,
    addProduct,
    addProductDetails,
    addAddress,
    chatMessagesPage,
    controlPanelel,
    complaints,
  };
}

class CustomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: Splash),
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.register, page: Register),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.categories, page: Categories),
    RouteDef(Routes.allProducts, page: AllProducts),
    RouteDef(Routes.productDetails, page: ProductDetails),
    RouteDef(Routes.emptyCart, page: EmptyCart),
    RouteDef(Routes.cart, page: Cart),
    RouteDef(Routes.payment, page: Payment),
    RouteDef(Routes.orderDetails, page: OrderDetails),
    RouteDef(Routes.homeNavigator, page: HomeNavigator),
    RouteDef(Routes.favorite, page: Favorite),
    RouteDef(Routes.shippingAddress, page: ShippingAddress),
    RouteDef(Routes.userType, page: UserType),
    RouteDef(Routes.openStore, page: OpenStore),
    RouteDef(Routes.storePage, page: StorePage),
    RouteDef(Routes.validationProcess, page: ValidationProcess),
    RouteDef(Routes.profile, page: Profile),
    RouteDef(Routes.controlPanel, page: ControlPanel),
    RouteDef(Routes.membersRequests, page: MembersRequests),
    RouteDef(Routes.addProduct, page: AddProduct),
    RouteDef(Routes.addProductDetails, page: AddProductDetails),
    RouteDef(Routes.addAddress, page: AddAddress),
  //  RouteDef(Routes.chatMessagesPage, page: ChatMessagesPage),
    RouteDef(Routes.controlPanelel, page: ControlPanelel),
    RouteDef(Routes.complaints, page: Complaints),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Splash: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Splash(),
        settings: data,
      );
    },
    Login: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Login(),
        settings: data,
      );
    },
    Register: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Register(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    Categories: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Categories(),
        settings: data,
      );
    },
    AllProducts: (data) {
      final args = data.getArgs<AllProductsArguments>(
        orElse: () => AllProductsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AllProducts(
          title: args.title,
          productModel: args.productModel,
        ),
        settings: data,
      );
    },
    ProductDetails: (data) {
      final args = data.getArgs<ProductDetailsArguments>(
        orElse: () => ProductDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductDetails(productModel: args.productModel),
        settings: data,
      );
    },
    EmptyCart: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EmptyCart(),
        settings: data,
      );
    },
    Cart: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Cart(),
        settings: data,
      );
    },
    Payment: (data) {
      final args = data.getArgs<PaymentArguments>(
        orElse: () => PaymentArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Payment(totalPrice: args.totalPrice),
        settings: data,
      );
    },
    OrderDetails: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OrderDetails(),
        settings: data,
      );
    },
    HomeNavigator: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeNavigator(),
        settings: data,
      );
    },
    Favorite: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Favorite(),
        settings: data,
      );
    },
    ShippingAddress: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShippingAddress(),
        settings: data,
      );
    },
    UserType: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserType(),
        settings: data,
      );
    },
    OpenStore: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OpenStore(),
        settings: data,
      );
    },
    StorePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StorePage(),
        settings: data,
      );
    },
    ValidationProcess: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ValidationProcess(),
        settings: data,
      );
    },
    Profile: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Profile(),
        settings: data,
      );
    },
    ControlPanel: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ControlPanel(),
        settings: data,
      );
    },
    MembersRequests: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MembersRequests(),
        settings: data,
      );
    },
    AddProduct: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddProduct(),
        settings: data,
      );
    },
    AddProductDetails: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddProductDetails(),
        settings: data,
      );
    },
    AddAddress: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddAddress(),
        settings: data,
      );
    },
    // ChatMessagesPage: (data) {
    //   final args = data.getArgs<ChatMessagesPageArguments>(nullOk: false);
    //   return MaterialPageRoute<dynamic>(
    //     builder: (context) => ChatMessagesPage(
    //       args.otherUser,
    //       args.chatId,
    //     ),
    //     settings: data,
    //   );
    // },
    ControlPanelel: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ControlPanelel(),
        settings: data,
      );
    },
    Complaints: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Complaints(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AllProducts arguments holder class
class AllProductsArguments {
  final String title;
  final List<ProductModel> productModel;
  AllProductsArguments({this.title, this.productModel});
}

/// ProductDetails arguments holder class
class ProductDetailsArguments {
  final ProductModel productModel;
  ProductDetailsArguments({this.productModel});
}

/// Payment arguments holder class
class PaymentArguments {
  final int totalPrice;
  PaymentArguments({this.totalPrice});
}

/// ChatMessagesPage arguments holder class
class ChatMessagesPageArguments {
  final SellerModel otherUser;
  final String chatId;
  ChatMessagesPageArguments({@required this.otherUser, @required this.chatId});
}

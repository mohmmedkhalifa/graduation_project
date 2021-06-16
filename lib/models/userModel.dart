import 'dart:io';

enum userType { customer, seller, admin }

class AppUser {
  String userId;
  String storeName;
  String userName;
  String email;
  String password;
  String mobileNumber;
  String address;
  File logo;
  String storeDescription;
  String logoUrl;
  userType type;
  bool isActive;
  bool isSeller;
  bool isCustomer;
  bool isAdmin;
  String age;
  String sellerId;
  String chatWith;

  AppUser({
    this.storeName,
    this.email,
    this.logo,
    this.userName,
    this.mobileNumber,
    this.address,
    this.password,
    this.isCustomer,
    this.userId,
    this.isSeller,
    this.type,
    this.isActive = false,
    this.isAdmin,
    this.storeDescription,
    this.age,
    this.sellerId,
    this.chatWith,
  });

  factory AppUser.newUser(Map map) {
    bool isSeller = map['isSeller'] ?? false;
    bool isCustomer = map['isCustomer'] ?? false;
    if (isSeller) {
      return AppUser.sellerUser(map);
    } else if (isCustomer) {
      return AppUser.customerUser(map);
    } else {
      return AppUser.admin(map);
    }
  }

  AppUser.sellerUser(Map map) {
    this.userId = map['userId'];
    this.userName = map['userName'];
    this.email = map['email'];
    this.password = map['password'] ?? '';
    this.mobileNumber = map['mobileNumber'];
    this.storeName = map['storeName'];
    this.logoUrl = map['logoUrl'];
    this.address = map['address'];
    this.type = userType.seller;
    this.storeDescription = map['storeDescription'];
    this.isActive = map['isActive'];
    this.age = map['age'];
    this.isSeller = map['isSeller'];
    this.sellerId = map['sellerId'];
    this.chatWith = map['chatWith'];
  }

  AppUser.admin(Map map) {
    this.userId = map['userId'];
    this.isAdmin = map['isAdmin'];
    this.email = map['email'];
    this.userName = map['userName'];
    this.mobileNumber = map['mobileNumber'];
    this.type = userType.admin;
  }

  AppUser.customerUser(Map map) {
    this.userId = map['userId'];
    this.userName = map['userName'];
    this.email = map['email'];
    this.password = map['password'] ?? '';
    this.mobileNumber = map['mobileNumber'];
    this.type = userType.customer;
    this.logoUrl = map['logoUrl'];
    this.isActive = map['isActive'];
    this.isCustomer = map['isCustomer'];
    this.chatWith = map['chatWith'];
  }

  toJson() {
    return type == userType.customer
        ? {
            'userName': this.userName,
            'email': this.email,
            'password': this.password,
            'mobileNumber': this.mobileNumber,
            'isCustomer': true,
            'logoUrl': this.logoUrl,
            'isActive': true,
            'type': userType.customer,
            'chatWith': this.chatWith,
          }
        : {
            'userName': this.userName,
            'email': this.email,
            'password': this.password,
            'mobileNumber': this.mobileNumber,
            'storeName': this.storeName,
            'storeDescription': this.storeDescription,
            'address': this.address,
            'logoUrl': this.logoUrl,
            'isSeller': true,
            'isActive': false,
            'age': this.age,
            'type': userType.seller,
            'sellerId': this.sellerId,
            'chatWith': this.chatWith,
          };
  }
}

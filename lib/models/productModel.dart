import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String productId;
  String productName;
  String productDesc;
  String productPrice;
  String productQuantity;
  String productCate;
  String imageUrl1;
  String imageUrl2;
  Timestamp date;
  String sellerID;

  ProductModel({
    this.productId,
    this.productName,
    this.productDesc,
    this.productPrice,
    this.productQuantity,
    this.productCate,
    this.imageUrl1,
    this.imageUrl2,
    this.date,
    this.sellerID
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productDesc = json['productDesc'];
    productPrice = json['productPrice'];
    productQuantity = json['productQuantity'];
    productCate = json['productCate'];
    imageUrl1 = json['imageUrl1'];
    imageUrl2 = json['imageUrl2'];
    date = json['date'];
    sellerID = json['sellerID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productDesc'] = this.productDesc;
    data['productPrice'] = this.productPrice;
    data['productQuantity'] = this.productQuantity;
    data['productCate'] = this.productCate;
    data['imageUrl1'] = this.imageUrl1;
    data['imageUrl2'] = this.imageUrl2;
    data['date'] = this.date;
    data['sellerID']= this.sellerID;
    return data;
  }
}

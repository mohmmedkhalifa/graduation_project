import 'package:graduation_project/models/productModel.dart';

class CartModel {
  String customerId;
  ProductModel productModel;

  CartModel({
    this.customerId,
    this.productModel,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    productModel = json['productModel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productModel'] = this.productModel;
    data['customerId'] = this.customerId;

    return data;
  }
}

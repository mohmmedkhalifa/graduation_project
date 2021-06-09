import 'package:flutter/material.dart';
import 'package:graduation_project/models/productModel.dart';

class CartProvider extends ChangeNotifier {
  ProductModel productModel;

  List<ProductModel> products = [];

  addToCart(ProductModel value) {
    products.add(value);
    notifyListeners();
  }

}

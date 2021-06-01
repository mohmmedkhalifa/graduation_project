import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/models/productModel.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel productModel;

  List<ProductModel> products = [];
  File file1;
  File file2;

  setFile1(File file) {
    this.file1 = file;
    notifyListeners();
  }

  setFile2(File file) {
    this.file2 = file;
    notifyListeners();
  }

  setProducts(List<ProductModel> value) {
    this.products = value;
    notifyListeners();
  }

  List<ProductModel> allProducts = [];

  setAllProducts(List<ProductModel> value)  {
    this.allProducts = value;
    notifyListeners();
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/models/sellerModel.dart';
import 'package:graduation_project/models/userModel.dart';

class SellerProvider extends ChangeNotifier {
  AppUser appUser;

  File file;

  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  setFile(File file) {
    this.file = file;
    notifyListeners();
  }

  List<SellerModel> sellertModel = [];

  setSellers(List<SellerModel> value) {
    this.sellertModel = value;
    notifyListeners();
  }

  List<SellerModel> get allSeller {
    notifyListeners();
    return [...sellertModel];


  }
}
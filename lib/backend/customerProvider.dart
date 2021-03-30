import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/models/customerModel.dart';
import 'package:graduation_project/models/userModel.dart';

class CustomerProvider extends ChangeNotifier {
  AppUser appUser;

  File file;
  List<CustomerModel> chefModel = [];

  setChefs(List<CustomerModel> value) {
    this.chefModel = value;
    notifyListeners();
  }

  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  setFile(File file) {
    this.file = file;
    notifyListeners();
  }
}

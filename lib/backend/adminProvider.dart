import 'dart:io';


import 'package:flutter/material.dart';
import 'package:graduation_project/models/adminModel.dart';
import 'package:graduation_project/models/userModel.dart';

class AdminProvider extends ChangeNotifier {
  AppUser appUser;

  File file;
  List<AdminModel> admins;

  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  setAdmin(List<AdminModel> value) {
    this.admins = value;
    notifyListeners();
  }

  setFile(File file) {
    this.file = file;
    notifyListeners();
  }
}
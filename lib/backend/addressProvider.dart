import 'package:flutter/material.dart';
import 'package:graduation_project/models/addressModel.dart';

class AddressProvider extends ChangeNotifier {
  AddressModel addressModel;

  List<AddressModel> addresses = [];

  setAddress(List<AddressModel> value) {
    this.addresses = value;
    notifyListeners();
  }

}

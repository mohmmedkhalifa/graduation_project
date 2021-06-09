import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/addressModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/10dropMenu.dart';
import 'package:graduation_project/widgets/1textField.dart';
import 'package:graduation_project/widgets/5appBar.dart';

import '../const.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  var formKey = GlobalKey<FormState>();

  String city;

  String address;
  AddressModel addressModel;

  saveForm() async {
    bool validate = formKey.currentState.validate();
    if (validate) {
      formKey.currentState.save();
      addressModel = AddressModel(
          address: this.address,
          city: this.city,
          customerId: Repository.repository.appUser.userId);
      await addAddressToFirebase(addressModel.toJson(), context);

      Get.snackbar('تم', 'تم إضافة العنوان');
      Duration(seconds: 3).delay(() {
        ExtendedNavigator.of(context).push(
          Routes.payment,
        );
      });
    } else {
      return;
    }
  }

  String validateAddress(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    }
    if (value.length < 3) {
      return '*حقل مطلوب';
    }
  }

  saveAddress(String newValue) {
    address = newValue;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'إضافة عنوان',
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                MyTextField(
                  lines: 3,
                  labelText: 'العنوان كاملاً',
                  keyboardType: TextInputType.text,
                  validator: validateAddress,
                  onSaved: saveAddress,
                ),
                DropMenu(
                  myMenu: cities,
                  title: 'المدينة',
                  dropValue: city,
                  onChanged: (c) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    this.city = c;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 30,
                ),
                MyButton(
                  title: 'إضافة العنوان',
                  onPressed: saveForm,
                  buttonColor: Colors.blue,
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

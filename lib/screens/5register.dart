import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/backend/sellerProvider.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/models/userModel.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/1textField.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:graduation_project/widgets/9circleCard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var formKey = GlobalKey<FormState>();
  final pageController = PageController(initialPage: 0);
  String name;
  String storeName;
  String email;
  String password;
  String phone;
  String storeDescription;
  String imageUrl;
  String age;
  File logo;
  bool isSeller = false;
  AppUser appUser;

  saveForm() async {
    bool validate = formKey.currentState.validate();
    if (validate) {
      formKey.currentState.save();

      if (isSeller) {
        appUser = AppUser.sellerUser({
          'userName': this.name,
          'email': this.email,
          'password': this.password,
          'mobileNumber': this.phone,
          'storeName': this.storeName,
          'logo': this.logo,
          'logoUrl': this.imageUrl,
          'storeDescription': this.storeDescription,
          'age': this.age,
          'isSeller': true
        });
      } else {
        appUser = AppUser.customerUser({
          'userName': this.name,
          'email': this.email,
          'password': this.password,
          'mobileNumber': this.phone,
          'isSeller': false,
        });
      }
      print(isSeller);
      isSeller
          ? await saveUserInFirebase(appUser, context).then(
              (value) => ExtendedNavigator.of(context).push(
                Routes.validationProcess,
              ),
            )
          : await saveUserInFirebase(appUser, context).then(
              (value) => ExtendedNavigator.of(context).push(
                Routes.homeNavigator,
              ),
            );
      print(isSeller);
    } else {
      return;
    }
  }

  String validateName(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    }
    if (value.length < 3) {
      return '*حقل مطلوب';
    }
  }

  saveName(String newValue) {
    name = newValue;
  }

  String validateStoreName(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    }
    if (value.length < 3) {
      return '*هذا النص قصير';
    }
  }

  saveStoreName(String newValue) {
    storeName = newValue;
  }

  String validateEmail(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    } else if (value.length < 3) {
      return '*هذا النص قصير';
    } else if (!isEmail(value)) {
      return '*صيغة خاطئة';
    }
  }

  saveEmail(String newValue) {
    email = newValue;
  }

  String validatePassword(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    } else if (value.length < 3) {
      return '*هذا النص قصير';
    }
  }

  savePassword(String newValue) {
    password = newValue;
  }

  String validatePhone(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    } else if (value.length < 10) {
      return '*هذا النص قصير';
    }
  }

  savePhone(String newValue) {
    phone = newValue;
  }

  String validateAge(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    } else if (value.length < 4) {
      return '*هذا النص قصير';
    }
  }

  saveAge(String newValue) {
    age = newValue;
  }

  String validateDescription(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    } else if (value.length < 10) {
      return '*هذا النص قصير';
    }
  }

  saveDesc(String newValue) {
    storeDescription = newValue;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: pageController,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 220.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/register.png'),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28.r),
                        child: Container(
                          width: double.infinity,
                          height: 517.h,
                          decoration: BoxDecoration(
                            color: Color(0xffD6CEF7),
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'التسجيل',
                                style: TextStyle(
                                  fontSize: 30.r,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              MyTextField(
                                isSecure: false,
                                lines: 1,
                                labelText: 'الاسم بالكامل',
                                keyboardType: TextInputType.name,
                                icon: Icon(Icons.drive_file_rename_outline),
                                onSaved: saveName,
                                validator: validateName,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              MyTextField(
                                isSecure: false,
                                lines: 1,
                                labelText: 'رقم الجوال',
                                keyboardType: TextInputType.phone,
                                icon: Icon(Icons.phone),
                                onSaved: savePhone,
                                validator: validatePhone,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              MyTextField(
                                isSecure: false,
                                lines: 1,
                                labelText: 'الإيميل',
                                keyboardType: TextInputType.emailAddress,
                                icon: Icon(Icons.email),
                                onSaved: saveEmail,
                                validator: validateEmail,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              MyTextField(
                                isSecure: true,
                                lines: 1,
                                labelText: 'كلمة المرور',
                                keyboardType: TextInputType.visiblePassword,
                                icon: Icon(Icons.vpn_key),
                                onSaved: savePassword,
                                validator: validatePassword,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              MyButton(
                                buttonColor: Colors.blue,
                                textColor: Colors.white,
                                title: 'التسجيل',
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    formKey.currentState.save();
                                    pageController.animateToPage(
                                      1,
                                      duration: Duration(milliseconds: 3),
                                      curve: Curves.easeInBack,
                                    );
                                  }


                                },
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'تملك حساباً؟  ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      ExtendedNavigator.of(context)
                                          .push(Routes.login);
                                    },
                                    child: Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 220.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/register.png'),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28.r),
                        child: Container(
                          width: double.infinity,
                          height: 517.h,
                          decoration: BoxDecoration(
                            color: Color(0xffD6CEF7),
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Center(
                                child: Text(
                                  'الاستمرار كـ',
                                  style: TextStyle(
                                    fontSize: 30.r,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              CircleCard(
                                text: 'بائع',
                                image: 'assets/images/shop.png',
                                onTap: () {
                                  formKey.currentState.save();
                                  isSeller = true;
                                  pageController.animateToPage(2,
                                      duration: Duration(milliseconds: 3),
                                      curve: Curves.easeInBack);
                                },
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              CircleCard(
                                text: 'مشتري',
                                image: 'assets/images/user.png',
                                onTap: () {
                                  isSeller = false;
                                  saveForm();
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              MyButton(
                                textColor: Colors.white,
                                buttonColor: Colors.red,
                                title: 'رجوع',
                                onPressed: () {
                                  pageController.animateTo(0,
                                      duration: Duration(microseconds: 3),
                                      curve: Curves.easeInBack);
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Scaffold(
              appBar: MyAppBar(
                title: 'فتح متجر',
              ),
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      MyTextField(
                        isSecure: false,
                        lines: 1,
                        labelText: 'اسم المتجر',
                        keyboardType: TextInputType.name,
                        icon: Icon(Icons.store),
                        onSaved: saveStoreName,
                        validator: validateStoreName,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      MyTextField(
                        isSecure: false,
                        lines: 1,
                        labelText: 'نشاط المتجر',
                        keyboardType: TextInputType.text,
                        icon: Icon(Icons.work_outlined),
                        onSaved: saveDesc,
                        validator: validateDescription,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      MyTextField(
                        isSecure: false,
                        lines: 1,
                        labelText: 'سنة الميلاد',
                        keyboardType: TextInputType.phone,
                        icon: Icon(Icons.calendar_today),
                        onSaved: saveAge,
                        validator: validateAge,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Selector<SellerProvider, File>(
                              builder: (context, value, child) {
                                return GestureDetector(
                                  onTap: () async {
                                    PickedFile pickedFile = await ImagePicker()
                                        .getImage(source: ImageSource.gallery);
                                    File file = File(pickedFile.path);
                                    Provider.of<SellerProvider>(context,
                                            listen: false)
                                        .setFile(file);
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                    ),
                                    child: Center(
                                      child: imageUrl == null
                                          ? Icon(
                                              Icons.upload_sharp,
                                              size: 24,
                                            )
                                          : Image.network(imageUrl),
                                    ),
                                  ),
                                );
                              },
                              selector: (x, y) {
                                return y.file;
                              },
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'الرجاء رفع شعار المتجر',
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      MyButton(
                        buttonColor: Colors.blue,
                        textColor: Colors.white,
                        title: 'تسجيل المتجر',
                        onPressed: saveForm,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

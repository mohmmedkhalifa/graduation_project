import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/models/userModel.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/1textField.dart';
import 'package:string_validator/string_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();

  String email;
  String password;

  AppUser appUser;

  saveForm() async {
    bool validate = formKey.currentState.validate();
    if (validate) {
      formKey.currentState.save();
      appUser = await signInUsingEmailAndPassword(email, password);

      if (appUser.isAdmin ?? false) {
        ExtendedNavigator.of(context).replace(Routes.controlPanel);
      }

      if (appUser.isActive) {
        ExtendedNavigator.of(context).replace(Routes.profile);
      } else {
        ExtendedNavigator.of(context).replace(Routes.validationProcess);
      }
    } else {
      return;
    }
  }

  String validateEmail(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    } else if (value.length < 3) {
      return '*حقل مطلوب';
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
      return '*حقل مطلوب';
    }
  }

  savePassword(String newValue) {
    password = newValue;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 304.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                  ),
                ),
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28.r),
                    child: Container(
                      width: double.infinity,
                      height: 433.h,
                      decoration: BoxDecoration(
                        color: Color(0xffD6CEF7),
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 30.r,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        MyTextField(
                          isSecure: false,
                          lines: 1,
                          labelText: 'الإيميل',
                          keyboardType: TextInputType.emailAddress,
                          icon: Icon(Icons.email),
                          validator: validateEmail,
                          onSaved: saveEmail,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        MyTextField(
                          isSecure: true,
                          lines: 1,
                          labelText: 'كلمة المرور',
                          keyboardType: TextInputType.visiblePassword,
                          icon: Icon(Icons.vpn_key),
                          validator: validatePassword,
                          onSaved: savePassword,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        MyButton(
                          buttonColor: Colors.blue,
                          textColor: Colors.white,
                          title: 'تسجيل الدخول',
                          onPressed: saveForm,
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ليس لديك حساب؟  ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                ExtendedNavigator.of(context)
                                    .push(Routes.register);
                              },
                              child: Text(
                                'سجل',
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

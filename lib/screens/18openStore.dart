import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/1textField.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class OpenStore extends StatefulWidget {
  @override
  _OpenStoreState createState() => _OpenStoreState();
}

class _OpenStoreState extends State<OpenStore> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                ),
                SizedBox(
                  height: 8.h,
                ),
                MyTextField(
                  isSecure: false,
                  lines: 1,
                  labelText: 'نشاط المتجر',
                  keyboardType: TextInputType.phone,
                  icon: Icon(Icons.work_outlined),
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
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.upload_sharp,
                            size: 24,
                          ),
                        ),
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
                  onPressed: () {
                    ExtendedNavigator.of(context).push(Routes.validationProcess);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

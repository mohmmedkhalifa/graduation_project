import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //item 1
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      width: 335.w,
                      height: 488.h,
                      decoration: BoxDecoration(
                        color: Color(0xffD6CEF7),
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 48.h,
                          ),
                          Text(
                            'مرحباً بكم في',
                            style: TextStyle(
                              fontSize: 26.r,
                              fontFamily: "Kat",
                            ),
                          ),
                          Text(
                            'سوق غزة للبضائع المستخدمة',
                            style: TextStyle(
                              fontSize: 26.r,
                              fontFamily: "Kat",
                              color: Colors.blue,
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 352.r,
                              height: 352.r,
                              child: Image.asset('assets/images/member.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            //item 2
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                'تسوق أذكى ، حياة أفضل',
                style: TextStyle(
                  fontSize: 26.r,
                  fontFamily: "Kat",
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            //item 3
            Center(
              child: Column(
                children: [
                  MyButton(
                    textColor: Colors.white,
                    buttonColor: Colors.blue,
                    title: 'تسجيل الدخول',
                    onPressed: () {
                      ExtendedNavigator.of(context).replace(Routes.login);
                    },
                  ),
                  //item 4
                  SizedBox(
                    height: 16.h,
                  ),
                  MyButton(
                    textColor: Colors.black,
                    buttonColor: Colors.white,
                    title: 'التسجيل',
                    onPressed: () {
                      ExtendedNavigator.of(context).replace(Routes.register);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MyButton(
                    textColor: Colors.black,
                    buttonColor: Colors.red,
                    title: 'التخطي',
                    onPressed: () {

                      ExtendedNavigator.of(context)
                          .replace(Routes.homeNavigator);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

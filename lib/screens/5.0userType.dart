import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/9circleCard.dart';

class UserType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
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
                            ExtendedNavigator.of(context)
                                .push(Routes.openStore);
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CircleCard(
                          text: 'مشتري',
                          image: 'assets/images/user.png',
                          onTap: () {
                            ExtendedNavigator.of(context)
                                .push(Routes.homeNavigator);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

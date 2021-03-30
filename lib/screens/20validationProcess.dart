import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';

class ValidationProcess extends StatefulWidget {
  @override
  _ValidationProcessState createState() => _ValidationProcessState();
}

class _ValidationProcessState extends State<ValidationProcess> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 5))
  //       .then((value) => autoValidationSeller(context))
  //       .then((value) {
  //     if (Repository.repository.appUser.isActive) {
  //       print(Repository.repository.appUser.isActive);
  //       ExtendedNavigator.of(context).push(Routes.profile);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 160),
          Image.asset(
            'assets/images/process.png',
            height: 120,
            width: 120,
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'الرجاء الانتظار بعض الوقت حتى يتم التحقق من البيانات',
              style: TextStyle(fontSize: 24, fontFamily: 'Kat'),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          MyButton(
            title: 'تصفح التطبيق',
            onPressed: () {
              ExtendedNavigator.of(context).push(Routes.homeNavigator);
            },
            buttonColor: Colors.blue,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 16,
          ),
          MyButton(
            title: 'تسجيل الخروج',
            onPressed: () {
              signOut(context);
              ExtendedNavigator.of(context).push(Routes.login);
            },
            buttonColor: Colors.red,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

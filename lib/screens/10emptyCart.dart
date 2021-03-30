import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class EmptyCart extends StatefulWidget {
  @override
  _EmptyCartState createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: 'عربة التسوق',
        ),
        body: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Center(
              child: Image.asset(
                'assets/images/empty.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              'لا يوجد منتجات',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'عذرا أنت لم تضع أي منتجات لعربيك حتى الان',
            ),
            SizedBox(
              height: 60,
            ),
            MyButton(
              title: 'اذهب للتسوق',
              buttonColor: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                ExtendedNavigator.of(context).push(Routes.homeNavigator);
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:graduation_project/widgets/7cartItem.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'المفضلة',
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => CartItem(),
        ),
      ),
    );
  }
}

Widget emptyFav(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 100,
      ),
      Center(
        child: Icon(
          Icons.favorite_border,
          size: 120,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        '  لا يوجد منتجات بالمفضلة',
        style: TextStyle(fontSize: 26),
      ),
      SizedBox(
        height: 20,
      ),
      Text('اضفط على القلب لبدء الإضافة المنتجات الي قائمة الامنيات'),
      SizedBox(
        height: 40,
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
  );
}

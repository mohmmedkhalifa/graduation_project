import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:graduation_project/widgets/6category.dart';

import '../const.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: 'التصنيفات',
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 16,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => CategoryWidget(
            imgUrl: 'assets/images/ct${index + 1}.png',
            category: categories[index],
          ),
        ),
      ),
    );
  }
}

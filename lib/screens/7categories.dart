import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:graduation_project/widgets/6category.dart';
import 'package:provider/provider.dart';

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
          itemCount:  categories.length,
          itemBuilder: (context, index) => CategoryWidget(
            onTap: (){
              ExtendedNavigator.of(context).push(Routes.allProducts,arguments: AllProductsArguments(title: categories[index]));
            },
            imgUrl:   'assets/images/cat${index + 1}.png',
            category: categories[index],
          ),
        ),
      ),
    );
  }
}

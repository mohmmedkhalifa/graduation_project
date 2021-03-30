import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/4product.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class AllProducts extends StatefulWidget {
  String title;

  AllProducts({this.title});

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: widget.title,
        ),
        body: GridView.builder(
          itemCount: 7,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) => ProductWidget(
            onTap: () {
              ExtendedNavigator.of(context).push(
                Routes.productDetails,
                arguments: ProductDetailsArguments(
                  title: 'أيفون 11',
                  imgUrl: 'assets/images/test.png',
                ),
              );
            },
            imageUrl: 'assets/images/test.png',
            productName: 'أيفون 11',
            productPrice: '60',
          ),
        ),
      ),
    );
  }
}

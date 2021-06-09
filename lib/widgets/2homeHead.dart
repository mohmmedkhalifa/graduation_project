import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:provider/provider.dart';

import '1textField.dart';

class HomeHead extends StatelessWidget {
  Future<bool> connectionState() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
   print('connect mobile');
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('connect wifi');
    } else {
          print('no connection ');;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products =
        Provider.of<ProductProvider>(context).allProducts;

    return  Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          ),
          child: Image.asset(
            'assets/images/top.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            MyTextField(
              icon: Icon(CupertinoIcons.search),
              labelText: 'ابحث',
            ),
            SizedBox(
              height: 16,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              itemCount: products.length,
              itemBuilder: (context, index, realIndex) => GestureDetector(
                onTap: () {
                  ExtendedNavigator.of(context).push(
                    Routes.productDetails,
                    arguments:
                        ProductDetailsArguments(productModel: products[index]),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: Image.network(
                    products[index].imageUrl1,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 90,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

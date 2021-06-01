import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class ProductDetails extends StatefulWidget {
  ProductModel productModel;

  ProductDetails({this.productModel});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: widget.productModel.productCate,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 300.h,
                  child: Image.network(
                    widget.productModel.imageUrl1,
                    fit: BoxFit.cover,
                  )),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    widget.productModel.productName,
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () {}),
                  IconButton(icon: Icon(Icons.share), onPressed: () {}),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    widget.productModel.productPrice,
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.star_rate_rounded), onPressed: () {}),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text('الوصف'),
              ),
              SizedBox(
                height: 8,
              ),
              Text('''
             ${widget.productModel.productDesc}  '''),
              Divider(),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MyButton(
                      onPressed: () {
                        ExtendedNavigator.of(context).push(Routes.emptyCart);
                      },
                      title: 'الشراء الان',
                      textColor: Colors.white,
                      buttonColor: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MyButton(
                      onPressed: () {
                        ExtendedNavigator.of(context).push(Routes.cart);
                      },
                      title: 'إضافة إلى السلة',
                      textColor: Colors.black,
                      buttonColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

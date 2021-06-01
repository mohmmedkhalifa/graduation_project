import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/4product.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  String title;

  AllProducts({this.title});

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> productModel = Provider.of<ProductProvider>(context)
        .allProducts
        .where((element) => element.productCate == widget.title)
        .toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: widget.title,
        ),
        body: productModel.length != 0
            ? GridView.builder(
                itemCount: productModel.length,
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
                           productModel: productModel[index]
                          ),
                        );
                      },
                      imageUrl: productModel[index].imageUrl1,
                      productName: productModel[index].productName,
                      productPrice: productModel[index].productPrice,
                    ))
            : Center(
                child: Text('لا يوجد منتجات في هذا التصنيف'),
              ),
      ),
    );
  }
}

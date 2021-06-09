import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/backend/cartProvider.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  String imageUrl;
  String productName;
  String productPrice;
  Function onPressed;
  Function onTap;
  ProductModel productModel;

  ProductWidget({
    this.onPressed,
    this.imageUrl,
    this.productName,
    this.productPrice,
    this.onTap,
    this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        child: Container(
          width: 200.r,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                  child: Image.network(
                    imageUrl,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          productName,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$productPrice \₪',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart_outlined),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(productModel);
                          Get.snackbar('تم', 'تم إضافة المنتج إلى السلة');
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

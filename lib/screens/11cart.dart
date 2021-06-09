import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/backend/cartProvider.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:graduation_project/widgets/7cartItem.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = Provider.of<CartProvider>(context).products;

    int totalPrice = 0;

    for (int i = 0; i < products.length; i++) {
      int price = int.parse(products[i].productPrice);
      totalPrice += price;
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: 'عربة التسوق',
        ),
        body: products.length == 0
            ? Center(
                child: Text('لم تقم بإضافة أي منتجات'),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 500.h,
                      child: ListView.builder(
                        itemCount: products.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => CartItem(
                          productModel: products[index],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        shadowColor: Colors.blue,
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 6,
                        child: ListTile(
                          leading: Text(
                            'الإجمالي:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '${totalPrice} \₪',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    MyButton(
                      title: 'الدفع',
                      textColor: Colors.white,
                      buttonColor: Colors.blue,
                      onPressed: () {
                        ExtendedNavigator.of(context).push(Routes.payment,
                            arguments: PaymentArguments(
                              totalPrice: totalPrice,

                            ));
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

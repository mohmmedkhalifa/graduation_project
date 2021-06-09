import 'package:flutter/material.dart';
import 'package:graduation_project/backend/cartProvider.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  ProductModel productModel;
  CartItem({this.productModel});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        shadowColor: Colors.blue,
        color: Colors.grey[200],
        elevation: 6,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                   productModel.imageUrl1,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    productModel.productName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  //     Text('1'),
                  //     IconButton(
                  //         icon: Icon(Icons.minimize), onPressed: () {}),
                  //   ],
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                  SizedBox(
                    height: 30,
                  ),
                  Text('${productModel.productPrice} \₪'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

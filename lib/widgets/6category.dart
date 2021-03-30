import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  String imgUrl;
  String category;
  Function onTap;

  CategoryWidget({this.imgUrl, this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: Colors.blue,
        margin: EdgeInsets.symmetric(horizontal: 16),
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.asset(
              imgUrl,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Card(
                margin: EdgeInsets.only(right: 16, top: 16),
                color: Colors.grey.withOpacity(0.2),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

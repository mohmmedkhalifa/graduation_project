import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  HomeTitle({this.text, this.onTap});

  String text;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: GestureDetector(
        onTap: onTap,
        child: Text(
          'عرض الكل',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
      leading: Text(
        text,
        style: TextStyle(fontSize: 26),
      ),
    );
  }
}

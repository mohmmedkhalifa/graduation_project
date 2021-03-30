import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  MyButton({
    Key key,
    this.onPressed,
    this.title,
    this.textColor,
    this.buttonColor,
  }) : super(key: key);

  Function onPressed;
  String title;
  Color textColor;
  Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 50.h,
      child: RaisedButton(
        onPressed: onPressed,
        color: buttonColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 26.r,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    Key key,
    this.title,

  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white,size: 22),
      backgroundColor: Colors.white,
      elevation: 2,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      centerTitle: true,

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}

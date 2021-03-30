import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'متجري',
        ),
      ),
    );
  }
}

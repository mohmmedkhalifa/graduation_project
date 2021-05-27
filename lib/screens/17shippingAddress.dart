import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:graduation_project/widgets/8addressWidget.dart';

class ShippingAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'عنوانين الشحن',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 600,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => AddressWidget(
                    address: 'رفح تل السلطان',
                  ),
                  itemCount:3,
                ),
              ),
              MyButton(
                title: 'إضافة عنوان',
                textColor: Colors.white,
                buttonColor: Colors.blue,
                onPressed: () {},
              ),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}

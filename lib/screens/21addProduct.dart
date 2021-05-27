import 'package:auto_route/auto_route.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/10dropMenu.dart';
import 'package:graduation_project/widgets/1textField.dart';
import 'package:graduation_project/widgets/5appBar.dart';

import '../const.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'إضافة منتج',
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              MyTextField(
                lines: 1,
                labelText: 'اسم المنتج',
              ),
              MyTextField(
                lines: 3,
                labelText: 'وصف المنتج',
              ),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      labelText: 'السعر',
                    ),
                  ),
                  Expanded(
                    child: MyTextField(
                      labelText: 'الكمية',
                    ),
                  ),
                ],
              ),
              DropMenu(
                myMenu: categories,
                title: 'التصنيف',
                dropValue: 'شاشات',
                onChanged: () {},
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 145 / size.width * size.width,
                    height: 145 / size.height * size.height,
                    decoration: BoxDecoration(
                      color: Color(0xffDBCBCB),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'أضف صورة رئيسية',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            '''سيرى الناس هذه الصورة عند ظهور إعلانك
في نتائج البحث ''',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DashedContainer(
                    child: Container(
                      width: 145 / size.width * size.width,
                      height: 145 / size.height * size.height,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Image.asset('assets/icons/gallery.png'),
                              onPressed: () {},
                            ),
                            Text(
                              'أضف (3) صور إضافية',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              '''قدم إعلانك بشكل أفضل للمشترين''',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                    ),
                    dashColor: Colors.black,
                    dashedLength: 10,
                    strokeWidth: 1,
                    borderRadius: 4,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              MyButton(
                title: 'إضافة المنتج',
                onPressed: (){
                  ExtendedNavigator.of(context).push(
                    Routes.addProductDetails,
                  );
                },
                buttonColor: Colors.blue,
                textColor: Colors.white,
              ),
              SizedBox(height: 16,),

            ],
          ),
        ),
      ),
    );
  }
}

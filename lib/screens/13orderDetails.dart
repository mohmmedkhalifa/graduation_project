import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar: MyAppBar(
          title: 'تفاصيل الطلب',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  color: Colors.grey[200],
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: Colors.blue,
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      'معلومات الطلب',
                      style: TextStyle(color: Colors.blue),
                    ),
                    subtitle: Column(
                      children: [
                        ListTile(
                          title: Text('رقم الطلب'),
                          trailing: Text('#56532213'),
                        ),
                        ListTile(
                          title: Text('تاريخ الطلب'),
                          trailing: Text('20/1/2021'),
                        ),
                        ListTile(
                          title: Text('الحالة'),
                          trailing: Text(
                            'قيد التجهيز',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  color: Colors.grey[200],
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: Colors.blue,
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'تفاصيل البائع',
                      style: TextStyle(color: Colors.blue),
                    ),
                    subtitle: Column(
                      children: [
                        ListTile(
                          title: Text('الاسم'),
                          trailing: Text('محمد خليفة'),
                        ),
                        ListTile(
                          title: Text('عنوان البائع'),
                          trailing: Text('رفح تل السلطان'),
                        ),
                        ListTile(
                          title: Text('رقم الجوال'),
                          trailing: Text('0597915437'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  color: Colors.grey[200],
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: Colors.blue,
                  child: ListTile(
                    leading: Icon(CupertinoIcons.cube_box_fill),
                    title: Text(
                      'المنتجات',
                      style: TextStyle(color: Colors.blue),
                    ),
                    subtitle: Column(
                      children: [
                        Image.asset('assets/images/test.png'),
                        Text(
                          'ايفون 11',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  color: Colors.grey[200],
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: Colors.blue,
                  child: ListTile(
                    leading: Icon(Icons.description_outlined),
                    title: Text(
                      'تفاصيل الطلب',
                      style: TextStyle(color: Colors.blue),
                    ),
                    subtitle: Column(
                      children: [
                        ListTile(
                          title: Text('الإجمالي'),
                          trailing: Text('500 \$'),
                        ),
                        ListTile(
                          title: Text('الخصم'),
                          trailing: Text('0 \$'),
                        ),
                        ListTile(
                          title: Text('الإجمالي الكلي'),
                          trailing: Text('500 \$'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text('هل لديك مشكلة؟ '),
                    GestureDetector(
                      onTap: (){},
                        child: Text('تواصل مع خدمة العملاء',style: TextStyle(color: Colors.blue),),),
                  ],
                ),
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

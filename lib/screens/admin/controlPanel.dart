import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/sellerProvider.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:provider/provider.dart';

import 'adminDrawer.dart';

class ControlPanel extends StatefulWidget {
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  void initState() {
    getAllSeller(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(title: 'لوحة التحكم'),
        drawer: AdminDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2_square_stack_fill, size: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled, size: 24),
              label: '',
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 180,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          Repository.repository.appUser.userName[0]
                              .toUpperCase(),
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      Repository.repository.appUser.userName,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            SizedBox(
              height: 16,
            ),
            Consumer<SellerProvider>(
              builder: (context, value, child) => Card(
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListTile(
                  title: Text('طلبات أعضاء جديدة'),
                  trailing: Text(
                    value.sellertModel
                        .where((element) {
                          return !element.isActive;
                        })
                        .length
                        .toString(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24)),
              child: ListTile(
                title: Text('طلبات منتجات جديدة جديدة'),
                trailing: Text('5'),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            MyButton(
              onPressed: ()  {
                Get.snackbar('جارٍ العمل', '..... الرجاء الانتظار ');
                autoValidationSeller(context).then(
                  (e) {
                    Provider.of<SellerProvider>(context, listen: false)
                        .allSeller
                        .where((element) => !element.isActive);
                   // setState(() {});
                    //Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
                  },
                );
              },
              title: 'تحقق وقبول جميع الأعضاء',
              buttonColor: Colors.blue,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/sellerProvider.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:provider/provider.dart';

import 'adminDrawer.dart';

class ControlPanelel extends StatefulWidget {
  @override
  _ControlPanelelState createState() => _ControlPanelelState();
}

class _ControlPanelelState extends State<ControlPanelel> {
  @override
  void initState() {
    getAllSeller(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar: MyAppBar(title: 'لوحة التحكم'),
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
                        Repository.repository.appUser.userName[0].toUpperCase(),
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
          SizedBox(
            height: 60,
          ),
          MyButton(
            onPressed: () {
              Get.snackbar('جارٍ العمل', '..... الرجاء الانتظار ');
              Provider.of<SellerProvider>(context, listen: false)
                  .autoVaildationProvider(context);
            },
            title: 'تحقق وقبول جميع الأعضاء',
            buttonColor: Colors.blue,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}

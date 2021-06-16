import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/backend/sellerProvider.dart';
import 'package:graduation_project/models/sellerModel.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:provider/provider.dart';

import 'adminDrawer.dart';

class MembersRequests extends StatefulWidget {
  @override
  _MembersRequestsState createState() => _MembersRequestsState();
}

class _MembersRequestsState extends State<MembersRequests> {
  @override
  Widget build(BuildContext context) {
    List<SellerModel> sellers =
        Provider.of<SellerProvider>(context).sellertModel;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(

            drawer: AdminDrawer(),
            appBar: AppBar(

              centerTitle: true,
              elevation: 4,
              iconTheme: IconThemeData(color: Colors.black, size: 22),
              backgroundColor: Colors.white,
              title: Text(
                'الأعضاء',
                style: TextStyle(color: Colors.black),
              ),
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'الأعضاء',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الأعضاء المحظورين',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: sellers.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Card(
                      color: Colors.white,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(sellers[index].logoUrl),
                        ),
                        title: Text(sellers[index].userName),
                        subtitle: Text(sellers[index].email),
                        trailing: sellers[index].isActive
                            ? SizedBox(
                                width: 80,
                                height: 40,
                                child: MyButton(
                                  title: 'حظر المستخدم',
                                  textColor: Colors.white,
                                  buttonColor: Colors.red,
                                  onPressed: () {
                                    Provider.of<SellerProvider>(context,
                                            listen: false)
                                        .blockUserProvider(
                                            context, sellers[index]);
                                    setState(() {});
                                    Get.snackbar(
                                        'جارٍ العمل', 'تم حظر المستخدم');
                                  },
                                ),
                              )
                            : Text(
                                'محظور',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: sellers.length,
                  itemBuilder: (context, index) => !sellers[index].isActive
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Card(
                            color: Colors.white,
                            shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(sellers[index].logoUrl),
                                ),
                                title: Text(sellers[index].userName),
                                subtitle: Text(sellers[index].email),
                                trailing: SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: MyButton(
                                    title: 'إلغاء حظر',
                                    textColor: Colors.white,
                                    buttonColor: Colors.red,
                                    onPressed: () {
                                      Provider.of<SellerProvider>(context,
                                              listen: false)
                                          .unBlockUserProvider(
                                              context, sellers[index]);
                                      setState(() {});
                                      Get.snackbar('جارٍ العمل',
                                          'تم إلغاء حظر المستخدم');
                                    },
                                  ),
                                )),
                          ),
                        )
                      : Container(),
                ),
              ],
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graduation_project/backend/sellerProvider.dart';
import 'package:graduation_project/backend/server.dart';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            drawer: AdminDrawer(),
            appBar: AppBar(
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white, size: 22),
              backgroundColor: Colors.purple[600],
              title: Text(
                'الأعضاء',
              ),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'الأعضاء',
                  ),
                  Tab(
                    text: 'الأعضاء المحظورين',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Consumer<SellerProvider>(
                  builder: (context, value, child) => ListView.builder(
                    itemCount: value.sellertModel.length,
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
                            backgroundImage:
                                NetworkImage(value.sellertModel[index].logoUrl),
                          ),
                          title: Text(value.sellertModel[index].userName),
                          subtitle: Text(value.sellertModel[index].email),
                          trailing: value.sellertModel[index].isActive
                              ? SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: MyButton(
                                    title: 'حظر المستخدم',
                                    textColor: Colors.white,
                                    buttonColor: Colors.red,
                                    onPressed: () {
                                      blockUser(
                                          context, value.sellertModel[index]);
                                    },
                                  ),
                                )
                              : Text(
                                  'محظور',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer<SellerProvider>(
                  builder: (context, value, child) => ListView.builder(
                    itemCount: value.sellertModel.length,
                    itemBuilder: (context, index) => !value
                            .sellertModel[index].isActive
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
                                  backgroundImage: NetworkImage(
                                      value.sellertModel[index].logoUrl),
                                ),
                                title: Text(value.sellertModel[index].userName),
                                subtitle: Text(value.sellertModel[index].email),
                                trailing: SizedBox(
                                        width: 80,
                                        height: 40,
                                        child: MyButton(
                                          title: 'إلغاء حظر',
                                          textColor: Colors.white,
                                          buttonColor: Colors.red,
                                          onPressed: () {
                                            unblockUser(context,
                                                value.sellertModel[index]);
                                          },
                                        ),
                                      )

                              ),
                            ),
                          )
                        : Container(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

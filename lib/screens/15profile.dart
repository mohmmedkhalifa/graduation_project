import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/screens/20validationProcess.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:octo_image/octo_image.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Repository.repository.appUser.isActive
        ? Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: MyAppBar(
                title: 'الصفحة الشخصية',
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            child: OctoImage(
                              image: CachedNetworkImageProvider(
                                  Repository.repository.appUser.logoUrl),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                              ),
                              errorBuilder: OctoError.icon(color: Colors.red),
                              fit: BoxFit.cover,
                            ),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            Repository.repository.appUser.userName,
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          !Repository.repository.appUser.isSeller
                              ? ListTile(
                                  leading: Icon(
                                    CupertinoIcons.suit_heart,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'المفضلة',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  onTap: () {
                                    ExtendedNavigator.of(context)
                                        .push(Routes.favorite);
                                  },
                                )
                              : Container(),
                          Repository.repository.appUser.isSeller
                              ? ListTile(
                                  onTap: () {
                                    ExtendedNavigator.of(context)
                                        .push(Routes.storePage);
                                  },
                                  leading: Icon(
                                    Icons.store,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'متجري',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                )
                              : ListTile(
                                  leading: Icon(
                                    Icons.store_mall_directory_outlined,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    'افتح متجر جديد',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          //    buildListTile(title: 'بياناتي', icon: Icons.person),
                          Repository.repository.appUser.isSeller == true
                              ? Container()
                              : buildListTile(
                                  title: 'طلباتي',
                                  icon: Icons.request_page_outlined),
                          Repository.repository.appUser.isSeller == true
                              ? Container()
                              : buildListTile(
                                  title: 'عنوانين الشحن',
                                  icon: Icons.location_pin,
                                  onTap: () {
                                    ExtendedNavigator.of(context).push(
                                      Routes.shippingAddress,
                                    );
                                  },
                                ),
                          buildListTile(
                              title: 'إضافة منتج',
                              icon: Icons.add_circle,
                              onTap: () {
                                ExtendedNavigator.of(context).push(
                                  Routes.addProduct,
                                );
                              }),
                          Repository.repository.appUser.isSeller == true
                              ? buildListTile(
                                  title: 'الإحصاءات',
                                  icon: Icons.stacked_line_chart)
                              : buildListTile(
                                  title: 'خيارات الدفع', icon: Icons.payment),
                          buildListTile(
                              title: 'تواصل معنا',
                              icon: Icons.quick_contacts_dialer),
                          buildListTile(
                              title: 'الشروط والأحكام',
                              icon: Icons.import_contacts),
                          buildListTile(title: 'عن المتجر', icon: Icons.info),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        title: Text(
                          'تسجيل الخروج',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : ValidationProcess();
  }
}

Widget buildListTile({String title, IconData icon, Function onTap}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(
      icon,
      color: Colors.black,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 20),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
    ),
  );
}

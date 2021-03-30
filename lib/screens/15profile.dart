import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/cat4.png'),
                      maxRadius: 50,
                      minRadius: 50,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Ahmed Ali',
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
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.suit_heart,
                        color: Colors.black,
                      ),
                      title: Text(
                        'المفضلة',
                        style: TextStyle(fontSize: 24),
                      ),
                      onTap: () {
                        ExtendedNavigator.of(context).push(Routes.favorite);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.store,
                        color: Colors.black,
                      ),
                      title: Text(
                        'متجري',
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
                    buildListTile(title: 'بياناتي', icon: Icons.person),
                    buildListTile(
                        title: 'طلباتي', icon: Icons.request_page_outlined),
                    buildListTile(
                      title: 'عنوانين الشحن',
                      icon: Icons.location_pin,
                      onTap: () {
                        ExtendedNavigator.of(context).push(
                          Routes.shippingAddress,
                        );
                      },
                    ),
                    buildListTile(title: 'خيارات الدفع', icon: Icons.payment),
                    buildListTile(
                        title: 'تواصل معنا', icon: Icons.quick_contacts_dialer),
                    buildListTile(
                        title: 'الشروط والأحكام', icon: Icons.import_contacts),
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
    );
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

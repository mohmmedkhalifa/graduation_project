import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/router.gr.dart';

class AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            currentAccountPicture: CircleAvatar(
              child: Text(
                Repository.repository.appUser.userName[0].toUpperCase(),
                style: TextStyle(fontSize: 25),
              ),
            ),
            accountName: Text(
              Repository.repository.appUser.userName,
              style: TextStyle(fontSize: 16),
            ),
            accountEmail: Text(
              Repository.repository.appUser.email,
              style: TextStyle(fontSize: 16),
            ),
          ),
          MyTile(
            icon: Icons.home_outlined,
            text: 'الصفحة الرئيسية',
            onTap: () {
              ExtendedNavigator.of(context).push(Routes.homeNavigator);
            },
          ),
          MyTile(
            icon: Icons.description_outlined,
            text: 'بياناتي',
            onTap: () {
              ExtendedNavigator.of(context).push(Routes.controlPanel);
            },
          ),
          MyTile(
            icon: Icons.person_outline,
            text: 'الأعضاء',
            onTap: () {
              ExtendedNavigator.of(context).push(Routes.membersRequests);
            },
          ),

          MyTile(
            icon: Icons.error_outline,
            text: 'الشكاوي',
            member: '3',
          ),
          MyTile(
            icon: Icons.logout,
            text: 'تسجيل الخروج',
            onTap: () {
              signOut(context);
            },
          ),
        ],
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  Function onTap;
  IconData icon;
  String text;
  String member;

  MyTile({
    this.text,
    this.icon,
    this.onTap,
    this.member,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        trailing: member == null
            ? null
            : Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    member,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
        leading: Icon(
          icon,
          size: 24,
        ),
        title: Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

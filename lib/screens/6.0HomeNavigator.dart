import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '11cart.dart';
import '14chat.dart';
import '15profile.dart';
import '6homePage.dart';
import '7categories.dart';


class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _page = 0;

  List<Widget> myPages = [
    HomePage(),
    Categories(),
    Cart(),
    Chat(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _page,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _page = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home, size: 24),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_grid_2x2, size: 24),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bag, size: 24),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble, size: 24),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.profile_circled,
                  size: 24,
                ),
                label: '',
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: myPages[_page]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adminDrawer.dart';
import 'complaints.dart';
import 'cp.dart';
import 'members.dart';

class ControlPanel extends StatefulWidget {
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  int _page = 0;

  List<Widget> myPages = [
    ControlPanelel(),
    MembersRequests(),
    Complaints(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              _page = index;
              setState(() {});
            },
            currentIndex: _page,
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
                icon: Icon(Icons.error_outline, size: 24),
                label: '',
              ),
            ],
          ),
          body: myPages[_page]),
    );
  }
}

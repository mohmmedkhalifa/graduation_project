import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'الرسائل',
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
                shadowColor: Colors.blue,
                child: ListTile(
                  leading: Image.asset('assets/images/cat4.png'),
                  title: Text('علي حرب'),
                  subtitle: Text('مرحبا محمود'),
                  trailing: Text('10:30 '),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

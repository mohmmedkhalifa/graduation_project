import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/screens/3member.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String userId = '';

  @override
  void initState() {
    super.initState();
    userId = getUserId();
    if (userId != null) {
      fetchSplashData(context);
    } else {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Member(),
          ),
        );
      });
    }
  }

  /*
  *


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = getUserId();
    if (userId != null) {
      fetchSplashData(context);
      getAllAds(userId, context);
      getAllAdsHome(context);
    } else {
      Future.delayed(Duration(seconds: 3)).then((value) {
        ExtendedNavigator.of(context).push(Routes.registerIntro);
      });
    }
  }
  * */

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/splash.png')),
      ),
    );
  }
}

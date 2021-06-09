import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/backend/addressProvider.dart';
import 'package:graduation_project/backend/adminProvider.dart';
import 'package:graduation_project/backend/customerProvider.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/backend/sellerProvider.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/screens/0splash.dart';
import 'package:graduation_project/screens/1onBoarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'backend/cartProvider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(SellerProvider());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = OnBoarding();
  } else {
    _screen = Splash();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SellerProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => CustomerProvider()),
        ChangeNotifierProvider(create: (context) => AdminProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MyApp(_screen),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
}

class MyApp extends StatelessWidget {
  Widget _screen;

  MyApp(this._screen);

//I/flutter (20734): 737.4545454545455
// I/flutter (20734): 392.72727272727275

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        allowFontScaling: true,
        designSize: Size(392.72727272727275, 737.4545454545455),
        builder: () => MaterialApp(
          builder: ExtendedNavigator.builder<CustomRouter>(
            router: CustomRouter(),
          ),
          debugShowCheckedModeBanner: false,
          title: 'سوق غزة',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: this._screen,
        ),
      ),
    );
  }
}

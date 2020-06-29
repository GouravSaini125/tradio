import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto/bottomNav.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/repos/prefs.dart';
import 'package:proto/screens/login.dart';
import 'package:proto/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Tradio',
      themeMode: ThemeMode.light,
      theme: ThemeData(fontFamily: 'Josefin'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    getLoginStatus(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(child: SignUpScreen(height: height, width: width));
  }

  getLoginStatus(BuildContext context) async {
    await Prefs.loadPrefs();
//    Prefs.prefs.remove("isLoggedIn");
    var val = Prefs.prefs.getBool("isLoggedIn") ?? false;
    if (val) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => BottomNav()));
    }
  }
}

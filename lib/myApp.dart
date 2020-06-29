import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto/bottomNav.dart';
import 'package:proto/repos/prefs.dart';
import 'package:proto/screens/signup.dart';

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

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

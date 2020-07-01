import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto/bottomNav.dart';
import 'package:proto/bottomNavService.dart';
import 'package:proto/repos/prefs.dart';
import 'package:proto/screens/signup.dart';
import 'package:proto/screens/userSelection.dart';

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return SafeArea(child: routeUser());
  }

  Widget routeUser() {
//    Prefs.prefs.remove("isLoggedIn");
    var val = Prefs.prefs.getBool("isLoggedIn") ?? false;
    var isUser = Prefs.prefs.getBool("isUser") ?? true;
    if (val) {
      return isUser ? BottomNav() : BottomNavService();
    }
    return UserSelection();
  }
}

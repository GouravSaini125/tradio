import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/myApp.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => Initiate(),
      ),
    );

class Initiate extends StatefulWidget {
  @override
  _InitiateState createState() => _InitiateState();
}

class _InitiateState extends State<Initiate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Tradio',
      themeMode: ThemeMode.light,
      theme: ThemeData(fontFamily: 'Josefin'),
      home: SplashScreen(
          seconds: 3,
          navigateAfterSeconds: new MyApp(),
          title: new Text(
            'Welcome In SplashScreen',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          image: new Image.asset('assets/images/flutter_logo.png'),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          loaderColor: ThemeColors.main,
          loadingText: Text("Loading Your App!"),
      ),
    );
  }
}

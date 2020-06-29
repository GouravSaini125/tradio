import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proto/anims/page_route.dart';
import 'package:proto/bottomNav.dart';
import 'package:proto/icons/google_icons.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/repos/auth.dart';
import 'package:proto/screens/login.dart';

import '../configs/ThemeColors.dart';

class SignUpScreen extends StatefulWidget {
  final double height, width;

  SignUpScreen({this.height, this.width});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool waiting = false;
  Auth auth;
//  TextEditingController name

  @override
  void initState() {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    auth = Auth(firebaseAuth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.bg,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(adjustedHeight(15.0)),
      //   child: AppBar(
      //     title: Text("Tradio"),
      //     backgroundColor: ThemeColors.main,
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: adjustedHeight(20.0),
              left: adjustedWidth(15.0),
              right: adjustedWidth(20.0)),
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.aspectRatio <= 2.0
                  ? adjustedHeight(80.0)
                  : 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: adjustedWidth(20.0),
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: adjustedWidth(10.0),
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: adjustedHeight(250.0)),
                child: Column(
                  children: <Widget>[
                    inputField("Name"),
                    inputField("Email"),
                    inputField("Password"),
                  ],
                ),
              ),
              SizedBox(
                height: adjustedHeight(50.0),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   waiting = true;
                  // });
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => BottomNav()));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      0, adjustedHeight(40.0), adjustedWidth(20.0), 0),
                  padding: EdgeInsets.fromLTRB(
                      adjustedWidth(55.0),
                      adjustedHeight(60.0),
                      adjustedWidth(55.0),
                      adjustedHeight(60.0)),
                  alignment: Alignment(0.0, 0.0),
                  child: waiting
                      ? SpinKitWave(
                          size: adjustedWidth(12.0),
                          color: Colors.white60,
                        )
                      : Text(
                          "Sign Up",
                          style: TextStyle(
                              color: ThemeColors.shadowLight,
                              fontSize: adjustedWidth(15.0),
                              fontFamily: "Quicksand"),
                        ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: ThemeColors.gradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeColors.shadowLight,
                          blurRadius: 10.0,
                          offset: Offset(-10.0, -10.0),
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(41, 72, 255, 0.3),
                          blurRadius: 15.0,
                          offset: Offset(10.0, 10.0),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: adjustedHeight(40.0),
              ),
              Center(
                child: Text(
                  "Or",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeColors.main,
                    fontSize: adjustedWidth(20.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(adjustedWidth(15.0)),
                    child: Icon(
                      Google.google,
                      color: Colors.purple,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(adjustedWidth(15.0)),
                    child: Icon(
                      Google.facebook_f,
                      color: Colors.blue[900],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(adjustedWidth(15.0)),
                    child: Icon(
                      Google.twitter,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: adjustedHeight(60.0), bottom: adjustedHeight(30.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account ? ",
                      style: TextStyle(
                        fontSize: adjustedWidth(25.0),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(createRoute(LoginScreen(
                            height: widget.height, width: widget.width)));
                      },
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                          fontSize: adjustedWidth(20.0),
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.main,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField(name, controller) {
    return Container(
      margin: EdgeInsets.only(top: adjustedHeight(55.0)),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: adjustedWidth(25.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0, adjustedHeight(40.0), adjustedWidth(20.0), 0),
                  padding: EdgeInsets.only(left: adjustedWidth(10.0)),
                  height: adjustedHeight(15.0),
                  child: TextField(
//                    controller: controller,
                    style: TextStyle(
                      fontSize: adjustedWidth(20.0),
                    ),
                    decoration: InputDecoration.collapsed(hintText: null),
                  ),
                  decoration: BoxDecoration(
                      color: ThemeColors.bg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeColors.shadowLight,
                          blurRadius: 5.0,
                          offset: Offset(-5.0, -5.0),
                        ),
                        BoxShadow(
                          color: ThemeColors.shadowDark,
                          blurRadius: 5.0,
                          offset: Offset(5.0, 5.0),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double adjustedHeight(double d) {
    return widget.height / d;
  }

  double adjustedWidth(double d) {
    return widget.width / d;
  }

  void register() {
    auth.signUpWithEmail(email: null, password: null)
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proto/anims/page_route.dart';
import 'package:proto/icons/google_icons.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  final double height, width;

  LoginScreen({this.height, this.width});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.bg,
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(adjustedHeight(15.0)),
//        child: AppBar(
//          title: Text("Prototype"),
//          backgroundColor: ThemeColors.main,
//        ),
//      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: adjustedHeight(20.0),
              left: adjustedWidth(15.0),
              right: adjustedWidth(20.0)),
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
                      "Sign In",
                      style: TextStyle(
                          fontSize: adjustedWidth(10.0),
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: adjustedHeight(250.0)),
                child: Column(
                  children: <Widget>[
                    inputField("Email"),
                    inputField("Password"),
                  ],
                ),
              ),
              SizedBox(
                height: adjustedHeight(30.0),
              ),
              Center(
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeColors.main,
                    fontSize: adjustedWidth(25.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0, adjustedHeight(40.0), adjustedWidth(20.0), 0),
                padding: EdgeInsets.fromLTRB(
                    adjustedWidth(55.0),
                    adjustedHeight(60.0),
                    adjustedWidth(55.0),
                    adjustedHeight(60.0)),
                alignment: Alignment(0.0, 0.0),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: ThemeColors.shadowLight,
                    fontSize: adjustedWidth(15.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: ThemeColors.gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
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
                      "Don't have an account ? ",
                      style: TextStyle(
                        fontSize: adjustedWidth(25.0),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(createRoute(
                            SignUpScreen(
                                height: widget.height, width: widget.width)));
                      },
                      child: Text(
                        "SignUp",
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

  Widget inputField(name) {
    return Container(
      margin: EdgeInsets.only(top: adjustedHeight(35.0)),
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
                    obscureText: name == "Password",
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
}

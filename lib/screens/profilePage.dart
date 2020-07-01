import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/repos/prefs.dart';
import 'package:proto/screens/userSelection.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFff5e62).withOpacity(0.2),
                        blurRadius: 10.0,
                        offset: Offset(1, 10))
                  ],
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: LinearGradient(
                      colors: ThemeColors.gradient2,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Center(
                child: Text(
                  "E",
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Example",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "example@gmail.com",
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 50,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF3a7bd5).withOpacity(0.2),
                          blurRadius: 10.0,
                          offset: Offset(1, 10))
                    ],
                    gradient: LinearGradient(
                        colors: ThemeColors.gradient3,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    "Change Password",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                Prefs.prefs.remove("isLoggedIn");
//                  FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => UserSelection()),
                    (route) => false);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFff5e62).withOpacity(0.2),
                            blurRadius: 10.0,
                            offset: Offset(1, 10))
                      ],
                      gradient: LinearGradient(
                          colors: ThemeColors.gradient2,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

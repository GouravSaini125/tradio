import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:proto/bottomNav.dart';
import 'package:proto/bottomNavService.dart';
import 'package:proto/configs/ThemeColors.dart';
import 'package:proto/screens/signup.dart';

class UserSelection extends StatefulWidget {
  @override
  _UserSelectionState createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  String userType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          // padding: EdgeInsets.all(50.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    userType = "user";
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  width: MediaQuery.of(context).size.width - 120,
                  height: MediaQuery.of(context).size.height / 3.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: userType == "user"
                              ? ThemeColors.gradient2
                              : [Colors.white, Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFff5e62).withOpacity(0.1),
                            blurRadius: 10.0,
                            offset: Offset(1, 10))
                      ]),
                  child: Center(
                    child: Text(
                      "User",
                      style: TextStyle(
                          color: userType == "user"
                              ? Colors.white60
                              : Colors.black,
                          fontSize: 30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    userType = "service";
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  width: MediaQuery.of(context).size.width - 120,
                  height: MediaQuery.of(context).size.height / 3.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: userType == "service"
                              ? ThemeColors.gradient3
                              : [Colors.white, Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF3a7bd5).withOpacity(0.1),
                            blurRadius: 10.0,
                            offset: Offset(1, 10))
                      ]),
                  child: Center(
                    child: Text(
                      "ServiceMan",
                      style: TextStyle(
                          color: userType == "service"
                              ? Colors.white60
                              : Colors.black,
                          fontSize: 30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                    // color: Color(0xFF1165C1),
                    gradient: LinearGradient(
                        colors: [Color(0xFF396afc), Color(0xFF2948ff)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(57, 106, 252, 0.3),
                          blurRadius: 10.0,
                          offset: Offset(3, 7.0))
                    ],
                    borderRadius: BorderRadius.circular(50.0)),
                child: IconButton(
                    icon: Icon(
                      EvaIcons.arrowCircleRight,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    onPressed: () {
                      if (userType != null || userType != "") {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                    )),
                            (route) => false);
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => userType == "user"
                        //             ? BottomNav()
                        //             : BottomNavService()),
                        //     (route) => false);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

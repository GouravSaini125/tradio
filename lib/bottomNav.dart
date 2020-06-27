import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:proto/screens/homePart.dart';
import 'package:proto/screens/mapPage.dart';
import 'package:proto/screens/signup.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = <Widget>[
      HomePage(),
      MapPage(),
      HomePage(),
      HomePage(),
    ];
    return Scaffold(
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white,
            // borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              activeColor: Color(0xfffea700),
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              duration: Duration(milliseconds: 800),
              // tabBackgroundColor: Colors.grey[800],
              tabs: [
                GButton(
                  icon: EvaIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: EvaIcons.listOutline,
                  text: 'Map',
                ),
                GButton(
                  icon: EvaIcons.person,
                  text: 'Profile',
                ),
                GButton(
                  icon: EvaIcons.settings,
                  text: 'Settings',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}

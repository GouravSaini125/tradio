import 'package:flutter/material.dart';

class ThemeColors {
    ThemeColors._();

    static const Color bg = Color(0xFFEFF3F6);
    static Color main = Colors.blue[900];
//    static const Color main = Color(0xFFFF27B0);
//    static const Color main = Color(0xFFEA9110);
//    static const Color main = Color(0xFFFAA221);
    static const Color shadowDark = Color.fromRGBO(0, 0, 0, 0.15);
    static const Color shadowLight = Colors.white;
    static  Color shadowColored = Color.fromRGBO(main.red, main.green, main.blue, 0.5);
}
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    fontFamily: 'QuickSand',
    primaryColor: const Color(0xff292d32),
    accentColor: const Color(0xff2BC9ED),
    scaffoldBackgroundColor: const Color(0xff292d32));

const Color kPrimary = Color(0xff292d32);
const Color kAccent = Color(0xff2BC9ED);
const List<BoxShadow> darkShadow = [
  BoxShadow(
      color: Colors.white12,
      blurRadius: 4,
      spreadRadius: 2,
      offset: Offset(-3, -3)),
  BoxShadow(
      color: Colors.black54,
      blurRadius: 4,
      spreadRadius: 2,
      offset: Offset(3, 3))
];
const List<BoxShadow> ultraDarkShadow = [
  BoxShadow(
      color: Colors.white24,
      blurRadius: 8,
      spreadRadius: 4,
      offset: Offset(-6, -6)),
  BoxShadow(
      color: Colors.black54,
      blurRadius: 8,
      spreadRadius: 4,
      offset: Offset(6, 6))
];

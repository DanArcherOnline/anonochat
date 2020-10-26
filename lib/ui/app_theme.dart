import 'package:flutter/material.dart';

Color primaryDarkColor = Color(0xFF1D232A);
Color primaryLightColor = Color(0xFF3D424C);
Color secondaryDarkColor = Color(0xFF292D38);
Color secondaryLightColor = Color(0xFF292D38);
Color lightestColor = Color(0xFFFAFBFF);

ThemeData appThemeData = ThemeData(
  backgroundColor: primaryDarkColor,
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: lightestColor,
      fontSize: 41,
    ),
    headline2: TextStyle(
      color: primaryLightColor,
      fontSize: 24,
    ),
    bodyText1: TextStyle(
      color: lightestColor,
      fontSize: 18,
      height: 1.2,
    ),
    caption: TextStyle(
      color: lightestColor,
      fontSize: 12,
    ),
  ),
  cursorColor: secondaryDarkColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

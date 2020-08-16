import 'package:flutter/material.dart';

//By default font is Montserrat as defined fontfamily inside these themes

const customFontFamily = "Montserrat";

final DARKTHEME = ThemeData(
  // primarySwatch: Colors.white,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.orange,
  fontFamily: customFontFamily,
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 50,
        fontFamily: customFontFamily,
        letterSpacing: 0.64,
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
      fontSize: 44,
      fontFamily: customFontFamily,
      letterSpacing: 0.64,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(fontSize: 25, fontFamily: customFontFamily),
    headline4: TextStyle(
        fontSize: 15,
        fontFamily: customFontFamily,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 0.64),
    headline5: TextStyle(
        fontSize: 13,
        fontFamily: customFontFamily,
        color: Colors.black,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64),
    headline6: TextStyle(
        fontSize: 13,
        fontFamily: customFontFamily,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64),
    bodyText1: TextStyle(fontSize: 20, fontFamily: customFontFamily),
    bodyText2: TextStyle(fontSize: 15, fontFamily: customFontFamily),
  ),
);

final LIGHTTHEME = ThemeData(
  // primarySwatch: Colors.black,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.orange,
  fontFamily: customFontFamily,
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 50,
        fontFamily: customFontFamily,
        letterSpacing: 0.64,
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
      fontSize: 44,
      fontFamily: customFontFamily,
      letterSpacing: 0.64,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(fontSize: 25, fontFamily: customFontFamily),
    headline4: TextStyle(
        fontSize: 15,
        fontFamily: customFontFamily,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        letterSpacing: 0.64),
    //opposite
    headline5: TextStyle(
        fontSize: 13,
        fontFamily: customFontFamily,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64),
    headline6: TextStyle(
        fontSize: 13,
        fontFamily: customFontFamily,
        color: Colors.black,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64),
    bodyText1: TextStyle(fontSize: 20, fontFamily: customFontFamily),
    bodyText2: TextStyle(fontSize: 15, fontFamily: customFontFamily),
  ),
);

// USE LIKE

/*

  Text(
  'example',
  style: TextStyle(fontFamily: 'RobotoMono'),
  );  


  //Weight is defined in assets so can use styles like this
  new TextStyle(
    fontSize: 24.0, 
    fontWeight: FontWeight.w600  // semi-bold
  );

*/

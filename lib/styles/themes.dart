// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: myColor),
  primaryColor: myColor,
  useMaterial3: true,
  listTileTheme: ListTileThemeData(
    iconColor: Colors.black,
    textColor: Colors.black,
  ),
  iconTheme: IconThemeData(color: Colors.black),
  drawerTheme: DrawerThemeData(backgroundColor: Colors.white, elevation: 0.0),
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
    bodyLarge: TextStyle(
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: myColor),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: myColor, fontSize: 25),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
    elevation: 0,
    actionsIconTheme: IconThemeData(color: myColor, size: 30),
  ),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: myColor,
    fillColor: Colors.black,
    prefixIconColor: myColor,
    suffixIconColor: myColor,
    labelStyle: TextStyle(
      color: myColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
  ),
);

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: myColor),
  primaryColor: myColor,
  useMaterial3: true,
  dialogBackgroundColor: darkbackground,
  listTileTheme: ListTileThemeData(
    iconColor: Colors.white60,
    textColor: Colors.white60,
  ),
  iconTheme: IconThemeData(color: Colors.white60),
  drawerTheme: DrawerThemeData(
    backgroundColor: darkbackground,
  ),
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white60),
    bodyLarge: TextStyle(color: Colors.white60),
  ),
  scaffoldBackgroundColor: darkbackground,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white60),
    backgroundColor: darkbackground,
    titleTextStyle: TextStyle(color: Colors.white60, fontSize: 25),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkbackground,
        statusBarIconBrightness: Brightness.light),
    elevation: 0,
    actionsIconTheme: IconThemeData(color: Colors.white60, size: 30),
  ),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: myColor,
    fillColor: Colors.white,
    prefixIconColor: myColor,
    suffixIconColor: myColor,
    labelStyle: TextStyle(
      color: myColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
  ),
);

Color darkbackground = Color(0xFF16262E);

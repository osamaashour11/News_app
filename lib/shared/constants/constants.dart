import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

String imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Loading_icon.gif?20151024034921';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        )),
    appBarTheme: const AppBarTheme(
      elevation: 0.00,
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 0.00,
        backgroundColor: Colors.white,
        showUnselectedLabels: false));
ThemeData darkTheme =  ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: HexColor('333739'),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.00,
      color: HexColor('333739'),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: HexColor('333739'),
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 0.00,
        backgroundColor: HexColor('333739'),
        showUnselectedLabels: false));
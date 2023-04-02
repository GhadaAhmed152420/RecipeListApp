import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.black, size: 28.0),
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.amber,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.black),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.amber,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        )
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white, size: 28.0),
      ),
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.amber,
      textTheme:  const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
      ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.amber,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        )
    ),

  );

}

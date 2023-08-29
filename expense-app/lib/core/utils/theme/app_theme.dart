import 'package:flutter/material.dart';

class AppTheme {
  ThemeData tema = ThemeData();

  ThemeData get getTheme => tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: const Color.fromRGBO(42, 147, 110, 1),
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          labelLarge: const TextStyle(
            color: Color.fromRGBO(42, 147, 110, 1),
            fontWeight: FontWeight.normal,
          ),
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 104,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
}

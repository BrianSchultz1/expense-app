import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData _base = ThemeData();

  ThemeData get getTheme => _base.copyWith(
        colorScheme: _base.colorScheme.copyWith(
          primary: const Color.fromRGBO(42, 147, 110, 1),
        ),
        textTheme: _base.textTheme.copyWith(
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

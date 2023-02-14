import 'package:aplicativo/Utils/AppRoutes.dart';
import 'package:aplicativo/pages/auth_page.dart';
import 'package:aplicativo/theme/app_theme.dart';
import 'package:aplicativo/pages/hidden_drawer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: ((context) => ExpensesApp()),
    ),
  );
}

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.AUTH: (context) => const AuthPage(),
        AppRoutes.HOME: (context) => const AuthPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const HiddenDrawer(),
      theme: AppTheme().getTheme,
    );
  }
}

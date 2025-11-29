import 'package:aplicativo/core/utils/theme/app_theme.dart';
import 'package:aplicativo/modules/pages/hidden_drawer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() async {
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
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const HiddenDrawer(),
      theme: AppTheme().getTheme,
    );
  }
}

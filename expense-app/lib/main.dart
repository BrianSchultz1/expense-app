import 'package:aplicativo/core/utils/theme/app_theme.dart';
import 'package:aplicativo/modules/pages/hidden_drawer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: true,
      builder: ((context) => ExpensesApp()),
    ),
  );
}

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HiddenDrawer(),
      theme: AppTheme().getTheme,
    );
  }
}

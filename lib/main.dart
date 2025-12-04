import 'package:aplicativo/core/utils/theme/app_theme.dart';
import 'package:aplicativo/core/utils/AppRoutes.dart';
import 'package:aplicativo/modules/pages/hidden_drawer.dart';
import 'package:aplicativo/modules/pages/splash_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kReleaseMode;
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      // Disable DevicePreview on web and in release builds
      enabled: !kIsWeb && !kReleaseMode,
      builder: (context) => const ExpensesApp(),
    ),
  );
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashPage(),
        AppRoutes.home: (context) => const HiddenDrawer(),
      },
      theme: AppTheme().getTheme,
    );
  }
}

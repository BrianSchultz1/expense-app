import 'dart:async';
import 'package:aplicativo/core/utils/AppRoutes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 117, 92, 1),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/image/Logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

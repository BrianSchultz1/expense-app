import 'package:flutter/material.dart';

import '../../../utils/assets/svg_assests.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacity = 0.0;
  double scale = 0.0;

  Color gradientFirst = Color.fromARGB(255, 20, 83, 54);
  Color gradientSecond = Color.fromARGB(255, 10, 34, 23);

  String logo = SvgAssets.mainLogo;

  Color textColor = Colors.white;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 5),
      () => setState(() {
        opacity = 1;
        scale = 1;
      }),
    );
  }

  void changeScreenAnimated() {
    setState(() {
      gradientFirst = Color.fromARGB(255, 20, 83, 54);
      gradientSecond = Color.fromARGB(255, 10, 34, 23);

      logo = SvgAssets.mainLogo;
      textColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                gradientFirst,
                gradientSecond,
              ]),
        ),
        child: SingleChildScrollView(),
      ),
    );
  }
}

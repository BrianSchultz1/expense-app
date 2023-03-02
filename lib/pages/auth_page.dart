import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold com um Stack como corpo
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(77, 143, 104, 0.498),
                  Color.fromRGBO(54, 114, 81, 0.898),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: const [],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesCourse extends StatelessWidget {
  // Construtor da classe CategoriesCourse
  const CategoriesCourse({super.key});

  // Método que constrói a interface de usuário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tópicos'),
      ),
      body: const Center(
        child: Text('Nenhum tópico por enquanto'),
      ),
    );
  }
}

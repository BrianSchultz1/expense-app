import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Criação de uma instância de FocusNode para remover o foco do teclado quando o usuário tocar em algum lugar fora dele.
  final FocusNode _unfocusNode = FocusNode();

  final myTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(42, 147, 110, 1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
            child: GestureDetector(
              // Quando o usuário tocar no container, o foco do teclado é removido.
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Container(
                  width: 310,
                  height: 460,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDEDEDE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(-0.3, -0.5),
                          child: Text(
                              'Desenvolvedor:\nBrian Friedrich dos Santos Schultz\nCursando engenharia de Software\nInstagram de conteúdo: @fluttups\nNovas funcionalidades em breve',
                              textAlign: TextAlign.start,
                              maxLines: 10,
                              style: myTextStyle),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

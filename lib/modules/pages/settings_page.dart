import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const Color _backgroundColor = Color.fromRGBO(47, 117, 92, 1);
  static const Color _cardColor = Color(0xFFDEDEDE);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ) ??
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

    final bodyStyle = theme.textTheme.bodyMedium?.copyWith(
          fontFamily: 'Poppins',
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w600,
        ) ??
        const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w600,
        );

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 380),
            child: Card(
              color: _cardColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Desenvolvedor:', style: titleStyle),
                    const SizedBox(height: 8),
                    Text(
                      'Brian Friedrich dos Santos Schultz',
                      style: bodyStyle,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Aplicativo para projeto de pesquisa (TCC)\nCurso: Engenharia de Software',
                      style: bodyStyle,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

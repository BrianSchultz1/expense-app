import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aplicativo/core/utils/AppRoutes.dart';
import 'package:aplicativo/modules/pages/home_page.dart';

void main() {
  group('Navegação com AppRoutes', () {
    testWidgets('deve navegar para MyhomePage via AppRoutes.home',
        (WidgetTester tester) async {
      final app = MaterialApp(
        routes: {
          AppRoutes.splash: (_) => const SizedBox(),
          AppRoutes.home: (_) => const MyhomePage(),
        },
        initialRoute: AppRoutes.home,
      );

      await tester.pumpWidget(app);
      await tester.pump();

      expect(find.byType(MyhomePage), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}

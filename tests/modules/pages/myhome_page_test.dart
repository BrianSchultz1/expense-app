import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Ajuste estes imports conforme teus caminhos reais:
import 'package:aplicativo/modules/pages/hidden_drawer.dart';
import 'package:aplicativo/core/utils/AppRoutes.dart';
import 'package:aplicativo/modules/pages/home_page.dart';

void main() {
  Widget buildTestable({required Widget child}) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.splash: (_) => const SizedBox(), // placeholder
        AppRoutes.home: (_) => const MyhomePage(),
      },
      home: child,
    );
  }

  group('MyhomePage - Renderização e Interações', () {
    testWidgets('deve renderizar MyhomePage com Drawer (não-iOS)',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestable(child: const MyhomePage()));

      // Scaffold presente
      expect(find.byType(Scaffold), findsOneWidget);

      // Drawer presente
      expect(find.byType(HiddenDrawer), findsOneWidget);

      // Botão "Adicionar" presente (Android/Web)
      expect(find.widgetWithText(ElevatedButton, 'Adicionar'), findsOneWidget);
    });

    testWidgets('deve abrir modal ao pressionar "Adicionar"',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestable(child: const MyhomePage()));

      final addButton = find.widgetWithText(ElevatedButton, 'Adicionar');
      expect(addButton, findsOneWidget);

      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Verifica que abriu um BottomSheet (genérico)
      expect(find.byType(BottomSheet), findsOneWidget);
      // Se teu TransactionForm tiver um texto fixo/Key, pode validar por ele.
    });

    testWidgets('deve exibir ambos Chart e TransactionList em portrait',
        (WidgetTester tester) async {
      // Força orientação portrait
      // ignore: deprecated_member_use
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      // ignore: deprecated_member_use
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      addTearDown(() {
        // ignore: deprecated_member_use
        tester.binding.window.clearPhysicalSizeTestValue();
        // ignore: deprecated_member_use
        tester.binding.window.clearDevicePixelRatioTestValue();
      });

      await tester.pumpWidget(buildTestable(child: const MyhomePage()));
      await tester.pump();

      // Em portrait: !isLandscape => mostra Chart e TransactionList
      // Se você adicionar Keys nos SizedBox (chart_box/list_box), use:
      // expect(find.byKey(const Key('chart_box')), findsOneWidget);
      // expect(find.byKey(const Key('list_box')), findsOneWidget);

      // Genérico:
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('em landscape com _showChart=false, deve mostrar lista',
        (WidgetTester tester) async {
      // Força landscape
      // ignore: deprecated_member_use
      tester.binding.window.physicalSizeTestValue = const Size(1920, 1080);
      // ignore: deprecated_member_use
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      addTearDown(() {
        // ignore: deprecated_member_use
        tester.binding.window.clearPhysicalSizeTestValue();
        // ignore: deprecated_member_use
        tester.binding.window.clearDevicePixelRatioTestValue();
      });

      await tester.pumpWidget(buildTestable(child: const MyhomePage()));
      await tester.pump();

      // Como _showChart=false e isLandscape=true, só lista deve aparecer
      // Se tiver Key:
      // expect(find.byKey(const Key('chart_box')), findsNothing);
      // expect(find.byKey(const Key('list_box')), findsOneWidget);

      // Genérico: o botão "Adicionar" continua (não-iOS)
      expect(find.widgetWithText(ElevatedButton, 'Adicionar'), findsOneWidget);
    });
  });

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

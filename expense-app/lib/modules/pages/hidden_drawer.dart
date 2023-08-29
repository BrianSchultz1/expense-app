// ignore_for_file: prefer_const_constructors

import 'package:aplicativo/modules/pages/home_page.dart';
import 'package:aplicativo/modules/pages/settings_page.dart';
import 'package:aplicativo/modules/pages/short_course.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  // Criação do estado para a classe HiddenDrawer
  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final myTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.black87,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'E X P E N S E',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Color.fromRGBO(14, 48, 36, 1),
        ),
        MyhomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'M I N I C U R S O',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Color.fromRGBO(14, 48, 36, 1),
        ),
        const ShortCourse(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'C O N F I G U R A Ç Ã O',
          baseStyle: myTextStyle,
          selectedStyle: myTextStyle,
          colorLineSelected: Color.fromRGBO(14, 48, 36, 1),
        ),
        const SettingsPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.black),
        ),
        child: HiddenDrawerMenu(
          backgroundColorMenu: const Color.fromRGBO(47, 117, 92, 1),
          screens: _pages,
          initPositionSelected: 0,
          slidePercent: 55,
          contentCornerRadius: 25,
        ),
      ),
    );
  }
}

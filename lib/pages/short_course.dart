// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class ShortCourse extends StatefulWidget {
  const ShortCourse({super.key});

  @override
  State<ShortCourse> createState() => _ShortCourseState();
}

class _ShortCourseState extends State<ShortCourse> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const <Widget>[
        ListTile(
          // textColor: Colors.black,
          title: Text('ACESSAR O MINICURSO'),
        ),
        ListTile(
          // textColor: Colors.black,
          title: Text(
            'EDUCAÇÃO FINANCEIRA',
            textAlign: TextAlign.end,
          ),
        ),
        ListTile(
          title: Text('Tópico I'),
          // onTap: () {},
        ),
        ListTile(
          title: Text('Tópico II'),
        ),
        ListTile(
          title: Text('Tópico III'),
        ),
        ListTile(
          title: Text('Tópico IV'),
        ),
        ListTile(
          title: Text('Tópico V'),
        ),
        const ListTile(
          title: Text('Tópico VI'),
        ),
        const ListTile(
          title: Text('Tópico VII'),
        ),
        const ListTile(
          title: Text('Tópico VIII'),
        ),
        const ListTile(
          title: Text('Tópico IX'),
        ),
        const ListTile(
          title: Text('Tópico X'),
        ),
        const ListTile(
          title: Text('Tópico XI'),
        ),
        const ListTile(
          title: Text('Tópico XII'),
        ),
        const ListTile(
          title: Text('Tópico XIII'),
        ),
        const ListTile(
          title: Text('Tópico XIV'),
        ),
      ],
    );
  }
}

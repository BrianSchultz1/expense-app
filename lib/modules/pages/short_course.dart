import 'package:flutter/material.dart';
import '../pages/category_course.dart';

class ShortCourse extends StatefulWidget {
  const ShortCourse({super.key});

  @override
  State<ShortCourse> createState() => _ShortCourseState();
}

const myText = TextStyle(
  color: Color.fromRGBO(70, 70, 70, 1),
  fontWeight: FontWeight.w600,
  fontSize: 15,
);

class _ShortCourseState extends State<ShortCourse> {
  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const CategoriesCourse();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          const ListTile(
            textColor: Colors.black,
            title: Text('ACESSAR O MINICURSO', style: myText),
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.75,
            height: 0.8,
          ),
          const ListTile(
            textColor: Colors.black,
            title: Text('EDUCAÇÃO FINANCEIRA',
                textAlign: TextAlign.end, style: myText),
          ),
          ListTile(
            title: const Text('Tópico I', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico II', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico III', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico IV', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico V', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico VI', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico VII', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico VIII', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico IX', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico X', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico XI', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico XII', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico XIII', style: myText),
            onTap: () => _selectCategory(context),
          ),
          ListTile(
            title: const Text('Tópico XIV', style: myText),
            onTap: () => _selectCategory(context),
          ),
        ],
      ),
    );
  }
}

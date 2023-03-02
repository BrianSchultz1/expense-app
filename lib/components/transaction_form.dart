import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'adaptative_buttom.dart';
import 'package:http/http.dart' as http;
import 'adaptative_text_fild.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _baseUrl = 'https://expense-15c96-default-rtdb.firebaseio.com/';

  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  Future _submitForm() async {
    if (_titleController.text.isEmpty ||
        double.tryParse(_valueController.text) == null ||
        _selectedDate == null) {
      return;
    }

    final response = await http.post(
      Uri.parse('$_baseUrl/expense.json'),
      body: jsonEncode({
        "name": _titleController.text,
        'value': double.parse(_valueController.text),
        'date': DateFormat('yyyy-MM-dd').format(_selectedDate!)
      }),
    );

    final title = _titleController.text;
    final value = double.parse(_valueController.text);

    widget.onSubmit(title, value, _selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(42, 147, 110, 1),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 60 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: 'Nome',
                labelStyle: const TextStyle(),
              ),
              const SizedBox(height: 10),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                labelStyle: const TextStyle(),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromRGBO(6, 100, 67, 1),
                    ),
                    onPressed: _submitForm,
                    child: const Text('Nova Despesa'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

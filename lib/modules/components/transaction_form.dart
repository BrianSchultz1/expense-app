import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    // keep for backwards compatibility - this method now only performs the actual POST
    await http.post(
      Uri.parse('${_baseUrl}expense.json'),
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

  Future<void> _confirmAndSubmit() async {
    // validate
    if (_titleController.text.isEmpty ||
        double.tryParse(_valueController.text) == null ||
        _selectedDate == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Preencha todos os campos!')),
        );
      }
      return;
    }

    // show confirmation dialog following project pattern
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmar'),
        content: Text(
            'Deseja adicionar a despesa "${_titleController.text}" no valor R\$${_valueController.text}?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () async {
              Navigator.of(ctx).pop(); // close confirm dialog
              try {
                await _submitForm();

                if (!mounted) return;

                // show success dialog
                showDialog(
                  context: context,
                  builder: (ctxSuccess) => AlertDialog(
                    title: const Text('Aviso!'),
                    content: const Text('Despesa adicionada com sucesso!'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(ctxSuccess).pop();
                          // close the bottom sheet/modal
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              } catch (e) {
                if (!mounted) return;
                showDialog(
                  context: context,
                  builder: (ctxErr) => AlertDialog(
                    title: const Text('Erro'),
                    content: Text('Erro ao adicionar despesa: $e'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctxErr).pop(),
                        child: const Text('OK'),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
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
              Card(
                color: Color.fromRGBO(6, 100, 67, 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: AdaptativeTextField(
                    controller: _titleController,
                    onSubmitted: (_) => _confirmAndSubmit(),
                    label: 'Nome',
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Color.fromRGBO(6, 100, 67, 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: AdaptativeTextField(
                    label: 'Valor (R\$)',
                    controller: _valueController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _confirmAndSubmit(),
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
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
                      elevation: 0,
                    ),
                    onPressed: _confirmAndSubmit,
                    child: const Text(
                      'Nova Despesa',
                      style: TextStyle(color: Colors.grey),
                    ),
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

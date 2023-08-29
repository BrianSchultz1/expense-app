import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateChanged;

  const AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChanged,
    Key? key,
  }) : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged!(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged!,
            ),
          )
        : SizedBox(
            height: 100,
            child: Column(
              children: [
                const SizedBox(height: 25),
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate!)}',
                    style: TextStyle(color: Color.fromARGB(255, 212, 212, 212)),
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromRGBO(6, 100, 67, 1),
                        elevation: 0,
                      ),
                      onPressed: () => _showDatePicker(context),
                      child: const Text(
                        'Selecionar Data',
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 212, 212)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}

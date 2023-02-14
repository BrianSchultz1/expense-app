import 'dart:io';
import 'dart:math';

import 'package:aplicativo/components/chart.dart';
import 'package:aplicativo/components/transaction_form.dart';
import 'package:aplicativo/components/transaction_list.dart';
import 'package:aplicativo/models/transaction.dart';
import 'package:aplicativo/pages/hidden_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyhomePage extends StatefulWidget {
  MyhomePage({Key? key});
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final List<Transaction> _transactions = [];
  final bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconlist = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final charIconlist =
        Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    final PreferredSizeWidget appBar = AppBar(
      toolbarHeight: 100,
      centerTitle: true,
      title: Column(
        children: const [],
      ),
    );

    final availableHeigth = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_showChart || !isLandscape)
              SizedBox(
                height: availableHeigth * (isLandscape ? 0.8 : 0.3),
                child: Chart(_recentTransactions),
              ),
            if (!_showChart || !isLandscape)
              SizedBox(
                height: availableHeigth * (isLandscape ? 1 : 0.7),
                child: TransactionList(_transactions, _removeTransaction),
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text(
                'Despesas Pessoais',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                // children: actions,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            drawer: const HiddenDrawer(),
            appBar: null,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : SizedBox(
                    height: 32,
                    width: 130,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromRGBO(6, 100, 67, 1),
                      ),
                      onPressed: () => _openTransactionFormModal(context),
                      child: const Text('Adicionar'),
                    ),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}

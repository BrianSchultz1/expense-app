import 'dart:math';
import 'dart:io';

import 'package:aplicativo/pages/hidden_drawer.dart';

import 'components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:device_preview/device_preview.dart';

import 'package:aplicativo/components/chart.dart';
import 'components/transaction_list.dart';
import '../models/transaction.dart';

main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: ((context) => ExpensesApp()),
    ),
  );
}

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyhomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: const Color.fromRGBO(42, 147, 110, 1),
          secondary: const Color.fromRGBO(42, 147, 110, 1),
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          button: const TextStyle(
            color: Color.fromRGBO(42, 147, 110, 1),
            fontWeight: FontWeight.normal,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

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

  // Widget _getIconButton(IconData icon, Function() fn) {
  //   return Platform.isIOS
  //       ? GestureDetector(onTap: fn, child: Icon(icon))
  //       : IconButton(icon: Icon(icon), onPressed: fn);
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconlist = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final charIconlist =
        Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    final actions = [
      // if (isLandscape)
      //   _getIconButton(
      //     _showChart ? iconlist : charIconlist,
      //     () {
      //       setState(() {
      //         _showChart = !_showChart;
      //       });
      //     },
      //   ),
      // _getIconButton(
      //   Platform.isIOS ? CupertinoIcons.add : Icons.add,
      //   () => _openTransactionFormModal(context),
      // ),
    ];

    final PreferredSizeWidget appBar = AppBar(
      toolbarHeight: 100,
      centerTitle: true,
      title: Column(
        children: const [
          SizedBox(height: 30),
          Text(
            'Despesas Pessoais',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // actions: actions,
    );

    final availableHeigth = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // if (isLandscape)
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Text('Exibir Gráfico'),
            //       Switch.adaptive(
            //         activeColor: Theme.of(context).colorScheme.secondary,
            //         value: _showChart,
            //         onChanged: (value) {
            //           setState(() {
            //             _showChart = value;
            //           });
            //         },
            //       ),
            //     ],
            //   ),
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
              middle: const Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                // children: actions,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            drawer: const HiddenDrawer(),
            appBar: appBar,
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

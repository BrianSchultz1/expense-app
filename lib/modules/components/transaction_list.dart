import 'package:flutter/material.dart';
import '../../core/packages/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: const [
                  SizedBox(height: 50),
                  Text(
                    'Nenhuma Despesa Cadastrada!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromRGBO(42, 147, 110, 1),
                  ),
                  title: Text(
                    tr.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? ButtonTheme.fromButtonThemeData(
                          data: const ButtonThemeData(
                            layoutBehavior: ButtonBarLayoutBehavior.constrained,
                            padding: EdgeInsets.all(0),
                          ),
                          child: TextButton.icon(
                            label: const SizedBox(),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Aviso!'),
                                  content: const Text(
                                      'Esta operação não pode ser desfeita!'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        onRemove(tr.id);
                                        Navigator.of(ctx).pop();
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete),
                            // label: const Text('Excluir'),
                            style: ButtonStyle(
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  Theme.of(context).disabledColor),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'R\$${tr.value}',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              color: Theme.of(context).disabledColor,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Aviso!'),
                                    content: const Text(
                                        'Esta operação não pode ser desfeita!'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          onRemove(tr.id);
                                          Navigator.of(ctx).pop();
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                ),
              );
            },
          );
  }
}

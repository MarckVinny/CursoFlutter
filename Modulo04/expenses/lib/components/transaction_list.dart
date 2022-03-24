import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];

                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 3,
                  ),
                  child: ListTile(
                    //*todo: leading: usado para definir ícone ou Avatar no
                    //*todo: inicio do ListTile()
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        //*todo: FittedBox() usado para ajustar o conteúdo
                        child: FittedBox(
                          child: Text(
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //*todo: usa a cor primaria do Thema criado em main.dart
                      //*todo: como preenchimento do CircleAvatar()
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    //*todo: title: usado para definir o Título do ListTile()
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    //*todo: subtitle: usado para definir o Subtitulo do ListTile()
                    subtitle: Text(
                      DateFormat('d MMMM y', "pt_BR").format(tr.date),
                    ),
                    //*todo: trailing: usado para definir ícone ou botão de ação no final do ListTile()
                    trailing: IconButton(
                      onPressed: () => onRemove(tr.id),
                      icon: const Icon(Icons.delete_forever_outlined),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
            ),
    );
  }
}

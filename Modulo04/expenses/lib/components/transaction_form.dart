import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  // ignore: use_key_in_widget_constructors
  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                    ),
                    onPressed: () {
                      final title = titleController.text;
                      // double.tryParse tenta converter o valor digitado em um
                      // valor double, ?? caso contrario, coloca o valor padrão 0.0
                      final value =
                          double.tryParse(valueController.text) ?? 0.0;
                      onSubmit(title, value);
                    },
                    child: const Text('Nova Transação'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

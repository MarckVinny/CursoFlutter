import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

// ignore: use_key_in_widget_constructors
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais'),
        ),
        body: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('Gráfico'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            const Card(
              child: Text('Lista de Transações'),
            ),
          ],
        ));
  }
}

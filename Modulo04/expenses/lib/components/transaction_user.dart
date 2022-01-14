import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';
import '../models/transaction.dart';

// ignore: use_key_in_widget_constructors
class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 'T1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T3',
      title: 'Conta #01',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T4',
      title: 'Conta #02',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T5',
      title: 'Conta #03',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T6',
      title: 'Conta #04',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T7',
      title: 'Conta #05',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T8',
      title: 'Conta #06',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  // Adiciona uma Nova Transação
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      // cria um ID único randômico com valor double e transforma em String.
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    // Controla o Estado da Tela
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Comunicação Indireta -> através de uma Função que espera os Dados vindos do Componete Filho
        TransactionForm(_addTransaction),
        // Comunicação Direta -> através de Dados
        TransactionList(_transactions),
      ],
    );
  }
}

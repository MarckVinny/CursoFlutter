import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      return {
        'day': 'T',
        'value': 9.99,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    /** 
       ** !  elevation: 6, -> cria um efeito de sombra no Card;
       ** margin: EdgesInserts.all(20), -> cria uma margem para que os componentes 
       ** não fiquem grudados;
       ** child: Row(), -> cria uma linha onde serão colocados os Componentes;
       ** children: [], -> cria uma Lista onde serão colocados os Componentes 
       ** propriamente dito;
       **/
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: const [],
      ),
    );
  }
}

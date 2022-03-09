import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      //todo: Pega os dias da semana
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      //todo: calula a soma das transações do dia da semana
      for (var i = 0; i < recentTransaction.length; i++) {
        //* compara se é o mesmo dia do mês é o mesmo que os últimos 7 dias
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        //* é o mesmo mês?
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        //* é o mesmo ano?
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        //* se o resultado for verdadeiro
        if (sameDay && sameMonth && sameYear) {
          //todo: acrescenta o valor à variável totalSum
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        //todo: define a Letra do dia da Semana
        'day': DateFormat.E('pt_BR').format(weekDay),
        'value': totalSum,
      };
      //*todo: .reversed.toList() reverte a ordem dos dias da semana
    }).reversed.toList();
  }

  //todo: Calcula o Valor Total da Semana
  double get _weekTotalValue {
    return groupedTransaction.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    /** 
       ** elevation: 6, -> cria um efeito de sombra no Card;
       ** margin: EdgesInserts.all(20), -> cria uma margem para que os componentes 
       ** não fiquem grudados;
       ** child: Row(), -> cria uma linha onde serão colocados os Componentes;
       ** children: [], -> cria uma Lista onde serão colocados os Componentes 
       ** propriamente dito;
    **/
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //todo: Alinha com espaçamentos iguais
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['day'],
                value: tr['value'],
                //todo: Calcula o Percentual da Semana
                //? lê-se:
                //? caso o Valor Total da Semana for igual a ZERO
                //? retorna ZERO
                //? caso contrário faz a divisão
                percentage: _weekTotalValue == 0
                    ? 0
                    : (tr['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

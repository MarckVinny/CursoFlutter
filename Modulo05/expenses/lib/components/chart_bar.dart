import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final label;
  final value;
  final double percentage;

  ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Column(
        children: [
          //*todo: Valor Transação
          Container(
            height: 20,
            child: FittedBox(
              child: Text('${value.toStringAsFixed(2)}'),
            ),
          ),
          const SizedBox(height: 5),
          //*todo: Barra Cinza
          Container(
            height: 60,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                //*todo: Barra Fracionada Percentage
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          //*todo: Dia da Semana
          Container(
            height: 20,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}

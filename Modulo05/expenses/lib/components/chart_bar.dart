import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: [
              //*todo: Valor Transação
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text('${value.toStringAsFixed(2)}'),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              //*todo: Barra Cinza
              Container(
                height: constraints.maxHeight * 0.6,
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
              SizedBox(height: constraints.maxHeight * 0.05),
              //*todo: Dia da Semana
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text(label),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

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
          Text('R\$ ${value.toStringAsFixed(2)}'),
          const SizedBox(height: 5),
          Container(
            height: 60,
            width: 10,
            child: null,
          ),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}
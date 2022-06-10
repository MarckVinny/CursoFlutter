import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  //todo: Comunicação Indireta
  //todo: Passa uma Função para o Componente para quando a Data mudar,
  //todo: ele comunicar ao Pai já que este Componente ñ tem Estado.
  final Function(DateTime) onDateChanged;

  const AdaptativeDatePicker({
    //todo: Data Selecionada
    required this.selectedDate,
    //todo: Data foi Alterada
    required this.onDateChanged,
  });

  //todo: Cria o Modal para Selecionar a Data
  _showDatePicker(BuildContext context) {
    //todo: Seleciona a Data
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      //todo: Função que seleciona uma Data
    ).then((pickedDate) {
      //todo: Testa se a Data é Nula e se for retorna
      if (pickedDate == null) {
        return;
      }
      //todo: Função que chama a Data Selecionada
      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Nenhuma Data Selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  ),
                ),
                TextButton(
                  //todo: chama a Função do Modal da Data por referência
                  onPressed: () => _showDatePicker(context),
                  child: const Text(
                    'Selecionar Data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
  }
}

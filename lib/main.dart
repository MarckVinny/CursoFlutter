// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
//   Cria a Lista de Perguntas e Respostas
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'vermelho', 'nota': 5},
        {'texto': 'verde', 'nota': 3},
        {'texto': 'branco', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'nota': 10},
        {'texto': 'Maria', 'nota': 5},
        {'texto': 'João', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ]
    },
  ];

  void _responder() {
    //  Evita mudanças de estado desnecessárias.
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }

    // ignore: avoid_print
    print(_perguntaSelecionada);
  }

  // Método Getter
  bool get temPerguntaSelecionada {
    // Se o índice for menor que o tamanho da lista
    // Significa que tem uma Pergunta Selecionada
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        // Se body tiver uma Pergunta Selecionada
        // Mostra a Column, caso contrário Não mostra nada.
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado('Parabéns!!!'),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

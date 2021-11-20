// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    // ignore: avoid_print
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'resposta': ['Preto', 'vermelho', 'verde', 'branco']
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão']
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'resposta': ['Maria', 'João', 'Leo', 'Pedro']
      },
    ];

    // Cria uma Lista contendo as respostas da Pergunta
    List<String> Respostas = perguntas[_perguntaSelecionada]['respostas'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(children: [
          Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
          ...respostas,
/*           ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print('Resposta 2 foi selecionada');
            },
            child: const Text('Resposta 2'),
          ),
          ElevatedButton(
            // ignore: avoid_print
            onPressed: () => print('Resposta 3!!!'),
            child: const Text('Resposta 3'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Resposta 4'),
          ), */
        ]),
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

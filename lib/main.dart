// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
//   Cria a Lista de Perguntas e Respostas
  final _perguntas = const [
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
    // Cria uma Lista contendo as respostas da Pergunta
    // Se respostas tiver Pergunta Selecionada,
    // mostra a Lista de Respostas
    // caso contrário Não mostra nada.
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        // Se body tiver uma Pergunta Selecionada
        // Mostra a Column, caso contrário Não mostra nada.
        body: temPerguntaSelecionada
            ? Column(children: [
                Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                // Pegar as Respostas, converter a Lista de Strings
                // em Lista de Widgets e transformar o resultado do Map
                // em uma Lista e usar o Spread "..." pra colocar a
                // Lista dentro dos Filhos de Column.
                ...respostas
                    .map((texto) => Resposta(texto, _responder))
                    .toList(),
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
              ])
            : [],
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

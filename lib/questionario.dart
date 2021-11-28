import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  // Método Getter
  bool get temPerguntaSelecionada {
    // Se o índice for menor que o tamanho da lista
    // Significa que tem uma Pergunta Selecionada
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Cria uma Lista contendo as respostas da Pergunta
    // Se respostas tiver Pergunta Selecionada,
    // mostra a Lista de Respostas
    // caso contrário Não mostra nada.
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(children: [
      Questao(perguntas[perguntaSelecionada]['texto'].toString()),
      // Pegar as Respostas, converter a Lista de Strings
      // em Lista de Widgets e transformar o resultado do Map
      // em uma Lista e usar o Spread "..." pra colocar a
      // Lista dentro dos Filhos de Column.
      ...respostas
          .map((resp) => Resposta(resp['texto'].toString(), quandoResponder))
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
    ]);
  }
}

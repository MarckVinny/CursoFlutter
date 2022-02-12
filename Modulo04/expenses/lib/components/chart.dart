import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

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

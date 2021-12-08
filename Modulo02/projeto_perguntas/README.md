# CURSO DE FLUTTER
###### Anotações do Curso ministrado pelo prof.: Leonardo Leitão da [COD3R](https://www.cod3r.com.br)

## MÓDULO 2

### Função main()

A _**função main()**_ é a porta de entrada de uma aplicação Flutter. É dentro dela que é chamada a _**função runApp()**_ que roda a aplicação em si.

0:36
###### 2. Noções básicas de Flutter
###### 31. Construindo o Primeiro Widget #02
Para isso, será criado uma **_Classe_** _"que é o Widget"_ e o nome da **_Classe_** será _**PerguntaApp**_ `class PerguntaApp`  que estenderá, extends  ou seja, há uma herança de _**StatelessWidget**_.

_**Exemplo:**_ `class PerguntaApp extends StatelessWidget{}` 

1:17
###### 2. Noções básicas de Flutter
###### 31. Construindo o Primeiro Widget #02
Será implementado um _Método_ que precisa retornar um _Widget_ e esse _Método_ é o `build()`  e ele irá receber um `BuildContext` que será chamado de `context`,  que irá retornar um _Widget_. 

_**Exemplo:**_  `build(BuildContext context){}`.

Dentro das chaves do _**Método build**_, o _Widget_ retornado return, será o `MaterialApp();`.

_**Exemplo:**_ `return MaterialApp();`.

Digitando **CTRL+ESPAÇO** no teclado dentro dos parênteses de _**MaterialApp**_, irá mostrar todos os atributos nomeados que poderão ser usados, que no caso em questão, será o home e será passado um outro _Widget_ de texto `Text()` para colocar o nome da home.

_**Exemplo:**_ `home: Text('Olá Flutter!!!'),`.

2:50
###### 2. Noções básicas de Flutter
###### 31. Construindo o Primeiro Widget #02
### Código de Exemplo

_**Exemplo:**_

```
class PerguntaApp extends StatelessWidget {
    
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Text('Olá Flutter!!!'),
        );
    }
}

```

3:59
###### 2. Noções básicas de Flutter
###### 31. Construindo o Primeiro Widget #02
Para chamar o App, será usada a _**função runApp()**_ passando como parâmetro uma instância do componente _**PerguntaApp()**_.

> **Dica:** ele não recebe nenhum parâmetro por usar o construtor padrão.

_**Exemplo:**_

```
main(){
    runApp(PerguntaApp());
}

```
4:16
###### 2. Noções básicas de Flutter
###### 31. Construindo o Primeiro Widget #02
### CÓDIGO COMPLETO

```
import 'package:flutter/material.dart';
 
main() {
  runApp(PerguntaApp());
}
 
class PerguntaApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Olá Flutter'),
    );
  }
}

```

0:09
###### 2. Noções básicas de Flutter
###### 32. Resumo até Aqui
### BREVE RESUMO:

No _**Método main()**_, ao invés de usar a abertura e fechamento de chaves, pode-se usar uma arrow function, sendo mais comum ser encontrada nos códigos.


_**Exemplo:**_ `main() => runApp(PerguntaApp());`

O Decorator `@override` é um _Método_ que obrigatoriamente o Componente Stateless precisa implementar.

O _**Método @override**_, estará sobrescrevendo o _**Método build()**_, sendo, que esse _Método_ quem irá chamar é o Flutter.

1:09
###### 2. Noções básicas de Flutter
###### 32. Resumo até Aqui
O Nó Raiz da árvore de componentes, é todo o resto estará debaixo deste componente raiz é o primeiro componente passado por parâmetro ao `runApp()` que no caso é o `PerguntaApp()`.

E o Componente terá o _**Método build()**_ que recebe um `BuildContext` quem passará esse contexto de construção é o próprio Flutter.

Cada Componente tem seu próprio contexto, e o componente Filho (já que temos uma árvore de componentes) ele tem como a partir do contexto, ter uma referência para o contexto do Pai e ele consegue se comunicar através desses contextos, mas cada componente tem seu próprio contexto.

2:09
###### 2. Noções básicas de Flutter
###### 32. Resumo até Aqui
O Widget principal no caso "Pai", é o `PerguntaApp()` e o Widget Filho direto é o `MaterialApp()`, também está sendo usando um parâmetro nomeado home: e no `Text()` foi passado um parâmetro posicional, ou seja, o primeiro parâmetro passado é exatamente o valor do texto que ele vai assumir, eventualmente se for colocado uma vírgula após as aspas, se terá acesso a outros parâmetros nomeados.

Os parâmetros posicionais são obrigatórios, os nomeados são opcionais e eventualmente podem ter um valor padrão.

0:21
###### 2. Noções básicas de Flutter
###### 33. Árvore de _Widgets_
### CONSTRUINDO A ÁRVORE DE COMPONENTES

Modificando a `home:` para ao invés de só usar o Componente `Text()` para colocar um texto simples, irá ser colocado outro Componente, o `Scaffold()` que cria a estrutura do Aplicativo, onde serão colocados outros _Widgets_ para dar forma ao App.

0:51
###### 2. Noções básicas de Flutter
###### 33. Árvore de _Widgets_
Digitando **CTRL+ESPAÇO** vai abrir um menu de opções com parâmetros nomeados que poderão ser usados dentro do `Scaffold()`, será usado o parâmetro nomeado appBar: e o Componete `AppBar()` que cria a barra superior do App.

Dentro de `AppBar()`, será criado outro parametro nomeado e outro componente dando assim forma a Árvore de _Widgets_.

Digitando **CTRL+ESPAÇO** dentro de `AppBar()`, aparecerá a opção de criar o título através do parâmetro nomeado title: sendo que ele espera como parâmetro um Widget, tendo então de se prestar muita atenção para não se tentar colocar uma string no lugar **Ex.:** `title: "Título de Exemplo"`, pois será um erro gravíssimo.

O correto é usar o _Widget_ `Text()`, `title: const Text('Perguntas')`

0:53
###### 2. Noções básicas de Flutter
###### 33. Árvore de _Widgets_
> **Dica:** usando const no `title:`, evita uso de memória e processamento  desnecessários.

2:46
###### 2. Noções básicas de Flutter
###### 33. Árvore de _Widgets_
E por último, saindo de `appBar:` e voltando para `home:` clicando em **CTRL+ESPAÇO** vamos encontrar parâmetro nomeado `body:` que é o corpo da aplicação e que também espera um _Widget_ como parâmetro. Que no caso vai ser usado um texto simples por enquanto. **Ex.:** `body: Text('Olá Flutter!!!'),`.

### EXEMPLO DO CÓDIGO ALTERADO

```
// ignore_for_file: use_key_in_widget_constructors
 
import 'package:flutter/material.dart';
 
main() => runApp(PerguntaApp());
 
class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
      ),
      body: Text('Olá Flutter'),
    ));
  }
}
```
0:04
###### 2. Noções básicas de Flutter
###### 37. Usando Column para Organizar o _Widgets_
### USANDO COLUNAS Column() PARA ORGANIZAR OS _WIDGETS_

0:50
###### 2. Noções básicas de Flutter
###### 37. Usando Column para Organizar o _Widgets_
Um dos Componentes usados para organizar layouts dentro do Flutter é o `Column()`  e dentro de Column irá receber um atributo chamado children que recebe como parâmetro um Widget que por sua vez retorna uma lista de _Widgets_.


_**Exemplo:**_
```
Column(
    children: <Widget>[
        Text(`Linha 1`),
        Text(`Linha 2`),
        Text(`Linha 3`),
    ],
)
```
1:54
###### 2. Noções básicas de Flutter
###### 37. Usando Column para Organizar o _Widgets_
### FAZENDO O MESMO PROCEDIMENTO MAIS RÁPIDO:

Usando o atalho **CTRL+PONTO** vai abrir um menu várias opções para envolver (wrap) esse trecho de código e nesse caso será envolvido por uma coluna `Column()`.

Dentro da Aplicação será criado uma lista de Perguntas:

_**Exemplo:**_
```
Final perguntas = [
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
];
```
3:46
###### 2. Noções básicas de Flutter
###### 37. Usando Column para Organizar o _Widgets_
Agora como as Perguntas estão em uma em uma lista em uma constante Final, ela pode ser acessada pelo Widget `Text()` através da notação ponto: `Text(perguntas.elements(0)),` ou acessando diretamente a lista: `Text(perguntas[0]),` acessando assim, o primeiro elemento da lista que é a primeira pergunta.

4:10
###### 2. Noções básicas de Flutter
###### 37. Usando Column para Organizar o _Widgets_
Para se criar um botão `RaisedButton()`, será preciso dois parâmetros/atributo.

O primeiro atributo é o child (filho) `child:` , onde, ele recebe um outro Widget:

_**Exemplo:**_ uma coluna, uma linha, um ícone, uma lista, um texto, um ícone e um texto ao mesmo tempo, ...

Nesse caso o `child:` irá receber um texto simples: `child: Text('Resposta 1'),` .

O outro atributo que `RaisedButton()` recebe é a ação do click do botão ele executar uma função, o onPressed: `onPressed: null,`  está nulo por ñ ter uma função ainda.

5:34
###### 2. Noções básicas de Flutter
###### 37. Usando Column para Organizar o _Widgets_
### CÓDIGO DE EXEMPLO ATÉ O MOMENTO:

Já com alterações Dart 2.14
```
// ignore_for_file: use_key_in_widget_constructors
 
import 'package:flutter/material.dart';
 
main() => runApp(PerguntaApp());
 
class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];
 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(children: [
          Text(perguntas.elementAt(0)),
          const ElevatedButton(
            onPressed: null,
            child: Text('Resposta 1'),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text('Resposta 2'),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text('Resposta 3'),
          ),
        ]),
      ),
    );
  }
}
```
0:03
###### 2. Noções básicas de Flutter
###### 39. Funções Anônimas
### FUNÇÕES ANÔNIMAS

Para habilitar um botão, e preciso criar uma função anônima no atributo _**onPressed**_.

_**Exemplo:**_ `onPressed: () {}`.

0:29
###### 2. Noções básicas de Flutter
###### 39. Funções Anônimas
>**DICA:** Quando se passa uma função como parâmetro, ñ se coloca os parênteses da Função, passe-se somente o nome da Função.

4:00
###### 2. Noções básicas de Flutter
###### 39. Funções Anônimas
Pode se habilitar o click de um botão _**onPressed**_: de 4 formas diferentes:

Declarando uma Função vazia:

_**Exemplo:**_ `onPressed: () {},`

Declarando uma Função que ñ retorna nada e a chamando por parâmetro.

```
void responder(){
  print('Resposta 1');
}
 
onPressed: responder,
```
Declarando a Função diretamente no parâmetro ***onPressed***.


_**Exemplo:**_
```
onPressed: () {
   print('Resposta 2 Selecionada');
}
```
Declarar diretamente usando a ***Função Arrow***.


_**Exemplo:**_ `onPressed: () => print('Resposta 3!!!!'),`

6:14
###### 2. Noções básicas de Flutter
###### 42. Usando StatefulWidget #02
### CONVERTENDO UM STATELESSWIDGET EM STATEFULWIDGET

6:23
###### 2. Noções básicas de Flutter
###### 42. Usando StatefulWidget #02
***Primeiro passo:*** trocar a herança extends  ao invés do componente *PerguntaApp* herdar de um *StatelessWidget*, irá herdar de um *StatefulWidget*.

***Segundo passo:*** foi colocado dentro do estado *State*  a variável de instancia da **_Classe_** que irá ser alterada a todo instante, pois, será o estado que irá controlar essa variável.

***Terceiro passo:*** como o _Método responder()_  também foi movido para dentro do estado *State*  pois também precisava do estado.

***Quarto passo:*** como a árvore de componentes também precisam do estado, ou seja, quando a variável mudar, a árvore de componentes precisa se atualizar de forma reativa, o _Método build()_  também foi movido para dentro do estado *State*.

7:05
###### 2. Noções básicas de Flutter
###### 42. Usando StatefulWidget #02
***Quinto passo:*** para conectar o *Componente StatefulWidget* ***PerguntaApp*** com o estado ***PerguntaAppState***  foram feitos em dois pontos:

A partir da herança extends foi passado no Generics qual foi o Tipo de ***Componete StatefulWidget*** estará ligado a esse *State* especificamente `<PerguntaApp>`.

E no *Componente StatefulWidget* ***PerguntaApp*** foi criado um _Método_ chamado ***createState()*** que espera um Componente do Tipo *PerguntaAppState* e irá retornar **return** o estado ***State*** ***PerguntaAppState()***.

7:29
###### 2. Noções básicas de Flutter
###### 42. Usando StatefulWidget #02
***PerguntaApp***, é o Componente que estará presente na ***Árvore de Componentes***, tanto, que ele está sendo passado para o ***runApp*** para ser chamado assim que o aplicativo for aberto ***runApp(PerguntaApp());***

Como o Flutter identifica que PerguntaApp é um Componente *StatefulWidget*, ele irá chamar o estado e a dentro de *PerguntaAppState* que gerencia o estado e a *Árvore de Componentes*.

8:32
###### 2. Noções básicas de Flutter
###### 42. Usando StatefulWidget #02
***Último passo:*** para que a Interface Gráfica seja notificada quando a variável for alterada, é colocar dentro de um `setState((){})` o trecho de comando `perguntaSelecionada++;`.


_**Exemplo:**_
```
setState((){
    perguntaSelecionada++;
});
```
Dessa forma, ele irá ficar monitorando se houve alguma mudança e essa mudança será atualizada na página da aplicação.

5:52
###### 2. Noções básicas de Flutter
###### 44. Tornando Membros Privados
### TRANSFORMANDO Variáveis, _Métodos, **_Classes_** e Componentes em PRIVADOS

6:01
###### 2. Noções básicas de Flutter
###### 44. Tornando Membros Privados
Colocando um underline (_) na frente de uma **_Classe, Variável, _Método_ ou Componente_**, o tornará Privado ou visível somente dentro do arquivo onde foi criado.

E para ser acessado externamente, deverá ser criado um _Método get e um set_.

7:05
###### 2. Noções básicas de Flutter
###### 44. Tornando Membros Privados
#### CÓDIGO ATUALIZADO COM **_CLASSE_**, METODOS E VARIÁVEIS PRIVADOS
```
// ignore_for_file: use_key_in_widget_constructors
 
import 'package:flutter/material.dart';
 
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
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];
 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(children: [
          Text(perguntas[_perguntaSelecionada]),
          ElevatedButton(
            onPressed: _responder,
            child: const Text('Resposta 1'),
          ),
          ElevatedButton(
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
          ),
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
```
O ***Componente PerguntaApp*** continuará público, caso seja enviado para outro arquivo, continuará tendo acesso ao mesmo.

0:12
###### 2. Noções básicas de Flutter
###### 45. Criando Widget Questão
### CRIANDO UM NOVO WIDGET - QUESTÃO

Neste *Widget* ficará todas as formatações relacionadas a este *Componente*, evitando de poluir a *Árvore de Componentes*.

0:32
###### 2. Noções básicas de Flutter
###### 45. Criando Widget Questão
Dentro da pasta lib será criado o arquivo ***questao.dart*** onde estarão todas as configurações relacionadas a **_Classe Questao_**.

2:26
###### 2. Noções básicas de Flutter
###### 45. Criando Widget Questão
A **_Classe_** criada terá o nome de *Questao*: `class Questao extends StatelessWidget{}`

Dentro da **_Classe_** será criado uma variável final do Tipo String de nome texto: `final String texto;`

Irá criar um Construtor para a **_Classe_**: `Questao(this.texto);`

E em *build*, irá criar um retorno `return` para o `Text()` usando a variável texto como parâmetro:
```
Widget build(BuildContext context){
    return Text(texto);
}
```
2:32
###### 2. Noções básicas de Flutter
###### 45. Criando Widget Questão
#### CÓDIGO **_CLASSE_** QUESTAO CRIADA
```
import 'package:flutter/material.dart';
 
class Questao extends StatelessWidget {
  final String texto;
 
  Questao(this.texto);
 
  @override
  Widget build(BuildContext context) {
    return Text(texto);
  }
}
```
2:39
###### 2. Noções básicas de Flutter
###### 45. Criando Widget Questão
Dentro do ***main.dart***, deverá ser importada a **_Classe_** criada anteriormente *questao.dart*: `import './questao.dart';`

E o Componente `Text()` será substituído pelo ***Componente Questao()*** recém criado juntamente com o parâmetro perguntas`[_perguntaSelecionada]`:

***Exemplo:***
```
...
  body: Column(children: [
     Questao(perguntas[_perguntaSelecionada]),
...
```
3:42
###### 2. Noções básicas de Flutter
###### 45. Criando Widget Questão
Com isso, se cria diversos componentes com configurações distintas que depois são agrupados na *Árvore de componentes*, criando assim aplicativos maiores.

0:03
###### 2. Noções básicas de Flutter
###### 47. Aplicando Estilo ao Widget Questão
#### APLICANDO ESTILO AO COMPONENTE QUESTAO

Agora ficará claro o motivo de se dividir os componentes.
```
questao.dart

...
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    );
  }
...
```
`TextAlign.center` não irá funcionar, pois, o texto ocupa todo o espaço do que está visível na tela.

Para conseguir centralizar o texto corretamente na tela, será preciso envolve-lo em um Container para poder configurar outros atributos relacionados ao Container

3:30
###### 2. Noções básicas de Flutter
###### 47. Aplicando Estilo ao Widget Questão
```
questao.dart
...
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(30),
...
```
`width: double.infinity,`  ajusta a largura do Container a largura da tela.

`margin: const EdgeInsets.all(30),`  ajusta a margem do Container em todos os lados.

`margin: EdgeInsets.fromLTRB(left, top, right, bottom),`  ajusta a margem do Container individualmente na esquerda left, no topo top, na direita right e na base bottom.

4:26
###### 2. Noções básicas de Flutter
###### 51. Passando Função Callback
```
main.dart

import 'package:flutter/material.dart';
 
class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;
 
  Resposta(this.texto, this.quandoSelecionado);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(50, 5, 50, 5),
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
...
```
A ***Função*** `quandoSelecionado` será chamada quando o botão for clicado.

Já em ***main.dart*** o segundo parâmetro do *Componente Resposta*, será usado o _Método_ `_responder`

0:01
###### 2. Noções básicas de Flutter
###### 53. Usando Tipo Map nas Perguntas
***OBS.:*** Correção dos erros de tipo *Object* e *String*

> Fala, pessoal!
> 
> Nessa aula vamos fazer uma pequena correção relacionada às próximas duas aulas. Devido a atualizações tanto no Dart quanto no Flutter, algumas questões em relação a tipagem mudaram um pouco.
> 
> Na próximas aulas, o código exato delas irá gerar um pequeno erro de tipagem na hora de transformar um Objeto em Lista e os elementos em String.
> 
> Para corrigir é bem simples. Basta adicionar duas funções em dois pontos do código, a função "cast()" para transformar um Objeto em Lista e a função "toString()" para transformar os elementos em Texto.
>
>O primeiro caso vai acontecer lá na criação do Widget Questao:
>
>Questao(perguntas[_perguntaSelecionada]['texto'].toString()),


0:15
###### 2. Noções básicas de Flutter
###### 53. Usando Tipo Map nas Perguntas
> O segundo caso, na aula seguinte, acontece lá no for:
> 
>```
>for (String textoResp in perguntas[_perguntaSelecionada]
>        .cast()['respostas']) {
>        respostas.add(Resposta(textoResp, _responder));
>    }
>        
>```
> Basta adicionar as duas funções, cast() e toString() e tudo funcionará certinho!
> 
> Bons estudos!

0:18
###### 2. Noções básicas de Flutter
###### 53. Usando Tipo Map nas Perguntas
### USANDO TIPO MAP NAS PERGUNTAS

0:23
###### 2. Noções básicas de Flutter
###### 53. Usando Tipo Map nas Perguntas
Atualizando o código atual, ao invés de retornar uma ***lista de Strings***, irá retornar uma ***lista de Maps*** e o *Map* será uma *String* e um *Objeto*.


_**Exemplo:**_ `List<Map<String, Object>>`

O ***Map*** normal retornando uma ***String***: `{'texto': 'Qual é a sua cor favorita?'}` *chave* ***'texto'*** e *valor* ***'Qual é a sua cor favorita?'***.

Map retornando ***String*** e ***Object***: `{'respostas': ['Qual é a sua cor favorita?']} ` *chave* ***'respostas'*** e *valor* ***['Preto', 'vermelho', 'verde', 'branco']***, pois, o Tipo ***Object*** retorna tanto ***String*** quanto uma ***Lista***.

3:48
###### 2. Noções básicas de Flutter
###### 53. Usando Tipo Map nas Perguntas
No ***Componente Questao***, as perguntas eram acessadas através de uma ***Lista de Strings***, agora elas serão acessadas por uma ***Lista de Maps***, contendo a *pergunta* e uma *lista de respostas*. Para acessar o valor de um *Map*, se acrescenta mais um par de colchetes e dentro *"com aspas simples"* se coloca o nome da chave que se quer acessar que no caso é: `['texto']`.

**Ex.:** `Questao(perguntas[perguntaSelecionada]['texto'].toString),`

***Obs.:*** o ***toString*** foi usado no final para converter o ***Map*** em uma ***String*** e não dar erro no Dart 2.14.

2:35
###### 2. Noções básicas de Flutter
###### 55. Lista para _Widgets_ #01
>***DICA:*** ESTUDAR DIFERENÇA ENTRE CÓDIGO IMPERATIVO E CÓDIGO DECLARATIVO.



#### EXEMPLO DE CÓDIGO IMPERATIVO:

2:56
###### 2. Noções básicas de Flutter
###### 55. Lista para _Widgets_ #01
#### Objetivo Principal:

1. Pegar a ***lista de respostas*** e colocar diretamente dentro da árvore de componentes;

1. A partir de todas as perguntas, já se tem ***_perguntaSelecionada***;

2. Então será criado um `for` que irá guardar em `textoResp` a pergunta selecionada `perguntas[_perguntaSelecionada]`  a chave `['resposta']`. Neste `for`, irá dar todas as respostas relacionadas à pergunta. ***Ex.:*** `for(String textoResp in perguntas[_perguntaSelecionada]['respostas']){};`

4. Agora devemos criar um Componente do Tipo `Resposta` com todas as respostas, para isso, será criada uma Lista `List` de Widget `<Widget>` com nome de ***respostas*** que recebe uma Lista vazia `['']`. ***Ex.:*** `List<Widget> respostas = [''];`



4:53
###### 2. Noções básicas de Flutter
###### 55. Lista para _Widgets_ #01
Dentro do `for` será adicionado na ***Lista de Respostas*** `respostas.add(),` será criado uma resposta passando o `textoResp` e o _Método_ `_responder` que precisam ser passados por parâmetro para criar uma resposta. ***Ex.:*** `respostas.add(Resposta(textoResp, _responder));` Isso de forma imperativa dizendo exatamente o que deve ser feito, passo a passo, foi criado uma `List`, foi criado um `for`, foi pego exatamente o que se queria, foi adicionado os elementos na lista e agora se tem uma ***Lista de Respostas***.

5:43
###### 2. Noções básicas de Flutter
###### 55. Lista para _Widgets_ #01
Agora será atualizado na *Árvore de Componentes* o Componente `Resposta`.
Será usado o operador três pontinhos ***"spread"*** `...`  que irá fazer com que todos os *Elementos da Lista* sejam adicionados nesta outra Lista que pertence ao `Column`

0:05
###### 2. Noções básicas de Flutter
###### 56. Lista para _Widgets_ #02
### REFATORANDO O CÓDIGO
#### DE IMPERATIVO PARA DECLARATIVO USANDO O MAP

Refatorando o laço `for`: criar uma ***Lista de String*** com nome ***respostas:*** `List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];`

Com esse comando gera uma *lista* contendo a *lista de respostas*.

Agora com o código `respostas.map`  (que é o nome da Lista) vai receber cada uma das `respostas` (que é a Lista de resposta).

Agora vai receber os valores textuais `((texto)` e converter esse texto em um Componente do Tipo ***Resposta*** `=> Resposta(`  passar o texto e o _Método_ *_responder*  como parâmetro para o Componente Resposta `texto, _responder));`  e como o ***map()***  não está retornando uma ***Lista*** mas sim um ***Widget***, então, devemos usar a ***notação ponto*** `.toList()`  para transformar tudo em uma ***Lista***.

2:55
###### 2. Noções básicas de Flutter
###### 56. Lista para _Widgets_ #02
***Código Completo:***  
`respostas.map((texto) => Respostas(texto, _responder)).toList();`

3:12
###### 2. Noções básicas de Flutter
###### 56. Lista para _Widgets_ #02
Com essa alteração tende se uma abordagem mais funcional e consequentemente mais declarativa.
Não foi preciso criar um ***laço for***, foram chamados as funções de transformação e foi gerado uma ***Lista de Widgets***.

Foi trocado uma abordagem ***Imperativa*** (usando o laço for) por uma ***abordagem mais funcional*** *"Declarativa"*

4:22
###### 2. Noções básicas de Flutter
###### 56. Lista para _Widgets_ #02
A partir da ***LIsta de Strings*** das respostas textuais `List<String> Respostas` foram gerados os Componentes os "*Widgets*", onde, o conteúdo será colocado diretamente na *Árvore de Componentes*.
```
questionario.dart

...
        body: Column(children: [
          Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
          ...respostas.map((texto) => Respostas(texto, _responder)).toList(),
...
```
#### Resumo do que essa lina de comando faz:

Pegou as ***respostas***, que é uma ***Lista de Strings***: `respostas`

Usou o ***map***, para converter a ***Lista de Strings*** em uma *Lista de Widgets*: `.map((texto) => Respostas(texto, _responder))` já que está dentro de uma *Árvore de Componentes*, então, o que será passado para o `Column` serão _Widgets_.

E uma vez convertido para _Widgets_, foi transformado o resultado do ***map()*** em uma ***Lista***: `.toList()`.

5:12
###### 2. Noções básicas de Flutter
###### 56. Lista para _Widgets_ #02
Por último,  foi usado o ***Spread*** `...` para pegar cada um dos ***elementos da Lista*** e coloca dentro da ***Lista dos Filhos*** `children` do Componete `Column`.

0:33
###### 2. Noções básicas de Flutter
###### 58. Evitando Acessar Pergunta Inválida
Extraindo a ***Lista de Perguntas e Respostas*** de dentro do _Método build_, transformando-a em ***privado*** `_perguntas` e em constante `const`
```
main.dart

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
...
```
1:33
###### 2. Noções básicas de Flutter
###### 58. Evitando Acessar Pergunta Inválida
#### TRATANDO O ERRO INDICE INVÁLIDO

Criando um _Método Getter_ `bool get temPerguntaSelecionada{}` se tem pergunta selecionada será mostrada a pergunta, caso contrário, a pergunta não será mostrada.
```
main.dart
...
bool get temPerguntaSelecionada{
    // Se o índice for menor que o tamanho da lista
    // Significa que tem uma Pergunta Selecionada
    return _perguntaSelecionada < _perguntas.length
}
...
```
2:32
###### 2. Noções básicas de Flutter
###### 58. Evitando Acessar Pergunta Inválida
### CRIANDO UMA ATRIBUIÇÃO CONDICIONAL

Se tiver ***Pergunta Selecionada*** `temPerguntaSelecionada`  ***então*** `?`  mostra a ***Lista de Respostas*** `_perguntas[_perguntaSelecionada]['respostas']`  ***caso contrário*** `:`  não mostra nada `[]` .
```
questionario.dart
...
List<String> respostas = temPerguntaSelecionada
    ? _perguntas[_perguntaSelecionada]['respostas']
    : [];
...
```
3:01
###### 2. Noções básicas de Flutter
###### 58. Evitando Acessar Pergunta Inválida
### CRIANDO UMA ATRIBUIÇÃO CONDICIONAL AO BODY

O ***body*** recebe a Coluna `Column` e para corrigir isso será atribuido ao ***body*** uma condição.

Se o ***body*** tiver uma ***Pergunta Selecionada*** `temPerguntaSelecionada` , ***então***, `?`  mostra a Coluna `Column`  ***caso contrário*** `:`  não mostra nada `[]`.

4:22
###### 2. Noções básicas de Flutter
###### 58. Evitando Acessar Pergunta Inválida
Usar o ***Getter*** `temPerguntaSelecionada`  para evitar mudanças de estado desnecessárias:
```
main.dart
...
void _responder() {
    if(temPerguntaSelecionada){
        setState(() {
          _perguntaSelecionada++;
        });
    }
}
...
```
0:05
###### 2. Noções básicas de Flutter
###### 64. Widget Questionário
### CRIANDO O COMPONENTE QUESTIONÁRIO

Criar um novo arquivo chamado ***questionario.dart***

Criar a **_Classe StatelessWidget Questionario_** e dentro do ***build*** copiar o Componente `Column` sendo assim refatorando o codigo.

E por ser uma **_Classe StatelessWidget_** as variáveis são do Tipo `final`.
```
questionario.dart
...
class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() quandoResponder;
 
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Questao(perguntas[perguntaSelecionada]['texto'].toString()),
      ...respostas.map((t) => Resposta(t, quandoResponder)).toList(),
    ]);
  }
}
...
```
1:52
###### 2. Noções básicas de Flutter
###### 64. Widget Questionário
Definir o Construtor da **_Classe_** usando ***parâmetros nomeados.***
```
questionario.dart
...
  const Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });
...
```
3:00
###### 2. Noções básicas de Flutter
###### 64. Widget Questionário
As respostas também estarão dentro do `build` do ***Questionario***.
```
questionario.dart

...
  @override
  Widget build(BuildContext context) {
    // Cria uma Lista contendo as respostas da Pergunta
    // Se respostas tiver Pergunta Selecionada,
    // mostra a Lista de Respostas
    // caso contrário Não mostra nada.
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
...
```
3:08
###### 2. Noções básicas de Flutter
###### 64. Widget Questionário
O ***Getter*** `temPerguntaSelecionada` também precisa estar dentro da **_Classe Questionario_**.
```
questionario.dart

...
  // Método Getter
  bool get temPerguntaSelecionada {
    // Se o índice for menor que o tamanho da lista
    // Significa que tem uma Pergunta Selecionada
    return perguntaSelecionada < perguntas.length;
  }
...
```
3:25
###### 2. Noções básicas de Flutter
###### 64. Widget Questionário
Também será preciso importar Questao e Resposta além do Material.
```
questionario.dart

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
...
```
4:41
###### 2. Noções básicas de Flutter
###### 64. Widget Questionário
No arquivo ****main.dart**** será preciso importar o ***questionário***.
```
main.dart

import './questionario.dart';
...
```
5:01
###### 2. Noções básicas de Flutter
###### 64. Widget Questionário
E agora no `body` será colocado o `Questionario()` juntamente com seus parâmetros.
```
main.dart

...
body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado('Parabéns!!!'),
...
```
0:05
###### 2. Noções básicas de Flutter
###### 66. Adicionando Pontuação #01
### ADICIONANDO PONTUAÇÃO

Dentro do ***main.dart*** estão as ***Respostas*** e a cada uma das `respostas`, estará associada sua `nota`.
```
mai.dart

...
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
...
```
2:46
###### 2. Noções básicas de Flutter
###### 66. Adicionando Pontuação #01
E dentro de ***questionario.dart*** quando for ***mapear*** as respostas, não será mais uma ***String*** e sim `List<Map<String, Object>>`  é um ***Object*** porque em ***main.dart***, vão ter situações em que terá uma ***String*** como ***valor*** e outras situações que terá um inteiro `int` como ***valor***.

Uma vez recebendo as ***respostas*** vai estar percorrendo as ***respostas*** `respostas.map((resp)` e estará ***pegando a resposta*** `texto => Respostas(resp['texto']` e depois ***convertendo em String*** `.toString(),`

### Revisando:

No `build` do ***Questionario***, está pegando uma ***Lista de Maps*** `List<Map<String, Object>>` está pegando cada uma das **Listas de respostas**:
```
main.dart

...

'respostas': [
    {'texto': 'Preto', 'nota': 10},
    {'texto': 'vermelho', 'nota': 5},
    {'texto': 'verde', 'nota': 3},
    {'texto': 'branco', 'nota': 1},
    ]
},
...
```
4:02
###### 2. Noções básicas de Flutter
###### 66. Adicionando Pontuação #01
Dentro do  `.map((resp)` ***chave : valor***, usando a ***função Map*** para transformar isso em Componente do Tipo ***Resposta***.

Como as ***respostas*** `(resp` é cada um dos elementos que tem ***texto*** e ***nota*** neste caso queremos o ***valor textual*** `(resp['texto'].toString,`.

### Código Completo:
```
questionario.dart

...

...respostas
          .map((resp) => Resposta(resp['texto'].toString(), quandoResponder))
          .toList(),
...
```
0:01
###### 2. Noções básicas de Flutter
###### 68. Adicionando Pontuação #02
### ADICIONANDO PONTUAÇÃO

Modificar a chave `'nota'` por `'pontuacao'` para facilitar o entendimento.

Quando o usuário for responder, nesse ponto, se sabe quanto vale resposta do usuário, no momento que houver o clique, precisa passar o valor da resposta para o _Método_ `main()`.

O _Método_ `_responder()` vai receber por parâmetro a pontuação do usuário, `_responder(int pontuacao);`.
Também será criado de forma global, a *variável pontuação total*: `var _pontuacaoTotal = 0;` 

2:29
###### 2. Noções básicas de Flutter
###### 68. Adicionando Pontuação #02
Será passado um *Método Anônimo* `()`  que irá ***chamar*** `=>` o _Método_ `quandoResponder` passando a ***resposta*** `resp` acessando o Valor  `['pontuacao']`. ***Ex.:*** `() => quandoResponder(resp['pontuacao'])`

3:09
###### 2. Noções básicas de Flutter
###### 68. Adicionando Pontuação #02
Convertendo ***Arrow Function*** em ***Block Body*** para o código ter uma leitura melhor.
```
questionario.dart

...
      ...respostas.map((resp) {
        return Resposta(
          resp['texto'].toString(),
          () => quandoResponder(resp['pontuacao']),
        );
      }).toList(),
...
```
Desta forma, se tem a `Resposta(` passando o valor textual e convertendo para ***String*** `resp['texto'].toString(),`  e passando a ***Função Anonima*** `() => quandoResponder(resp['pontuacao']), ` e a ***Resposta*** está sendo retornada através do *Método Map* `respostas.map((resp)`  e que depois é convertido para uma ***Lista*** `.toList(),`.

0:04
###### 2. Noções básicas de Flutter
###### 69. Adicionando Pontuação #03
Modificando a tela de ***Resultado***, com resultados condicionais.
Em ***Resultado*** será criada a variável ***pontuação*** `final int pontuacao;` que guardará o valor do ***Resultado*** .

Também será criado o ***Construtor*** da **_Classe_** que receberá por parâmetro o valor da variável: `Resultado(this.pontuacao);`

No Componente main o Componente ***Resultado*** espera um parâmetro que é a `pontuação`, então, ele receberá a ***Pontuação Total***: `Resultado(_pontuacaoTotal);`

Voltando ao Componente ***Resultado***, será criado um ***Getter*** que mostrará a frase de forma condicional.
```
resultado.dart

...
  String get fraseResposta {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!!!';
    } else {
      return 'Nível jedi!!!!!';
    }
...
```
0:02
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
### Reiniciando o Questionário
Será criado um botão para que possa voltar para o inicio do questionário com o valor das variáveis zeradas.

Uma das questões importantes com relação a comunicação entre os Componentes é a ***Comunicação Direta*** e ***Comunicação Indireta***.

***Comunicação Direta:*** é quando o *Componente Pai* passa parâmetros para o *Componente Filho*.

***Comunicação Indireta:*** é quando o *Componente Pai* passa uma ***Função*** para o *Componente Filho* para que o Componente Filho chame essa Função e então o Componente Pai seja notificado.

0:50
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
### Exemplo Comunicação Direta:

O *Componente Pai*, `PerguntaApp` passou um parâmetro `_pontuacaoTotal` para o *Componente Filho* `Resultado` que mostrou um determinado Valor.

No *Componente Pai*, `Questionario` foram passados como parâmetro: `_perguntas, _perguntaSelecionada` e também foi passado o _Método_, que será chamado em algum momento e dessa forma, o *Componente filho* pode chamar um _Método_ passando a informação para o *Componente Pai*.

2:03
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
Exatamente através desse _Método_ `_responder()`, que está recebendo do *Componente Filho* o Atributo `int` ***pontuacao***.
E a ***Comunicação Indireta diz:***  que será mandado uma ***Função*** para o *Componente Filho*, o Componente Filho irá chamar essa Função em algum momento e mandar ***Dados*** ao *Componente Pai* a partir dos parâmetro dessa Função `_responder()`.
```
main.dart

...
  void _responder(int pontuacao) {
    //  Evita mudanças de estado desnecessárias.
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        // Soma o valor do parâmetro pontuacao com o valor da
        //Variável Global _pontuacaoTotal .
        _pontuacaoTotal += pontuacao;
      });
    }
...
```
2:17
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
### Exemplo Comunicação Indireta:

Será criado um _Método_ `_reiniciarQuestionario(){}`,  dentro, será chamado o `setState((){})` e dentro irá reiniciar as variáveis: `_perguntaSelecionada = 0;` e `_pontuacaoTotal = 0;`

Com isso esses dois valores foram reinicializados para seus ***valores iniciais***.
```
main.dart
...
  // Os dois valores foram reinicializados para seus valores inicial.
  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }
...
```
2:45
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
Agora a ***Função*** `_reiniciarQuestionario` será passada como parâmetro para o Componente ***Resultado***.

No *Componente Resultado* será adicionado mais um parâmetro que será um `final` Função `Function()` que não recebe parametro e que ñ retorna nada `void`: ***Ex.:*** `final void Function() quandoReiniciarQuestionario;`.

No ***Construtor*** será acrescentado mais um parâmetro `this.quandoReiniciarQuestionario`. ***Ex:*** `Resultado(this.pontuacao, this.quandoReiniciarQuestionario);`.
```
resultado.dart
 
...
class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
 
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);
...
```
2:48
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
A ***Função*** `_reiniciarQuestionario` será chamada quando o botão for acionado, que será criado à seguir.

Essa ***Função*** `_reiniciarQuestionario` será adicionada como parâmetro ao *Componente Resultado* em ***Main***, pois é obrigatório.
```
main.dart
 
...
 
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
 
...
```
3:53
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
Agora, dentro de ***Resultado*** dentro de `build`, o ***Widget Center*** será envolvido por uma coluna ***wrap with Column*** e a coluna será centralizada com `mainAxisAlignment: mainAxisAlignment.center,`.

Agora que o Componente tem mais de um Elemento, mais de um filho, depois de ***Center*** pode se colocar mais um ***Elemento***.

### Será adicionado um TextButton:
```
resultado.dart
 
...
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          fraseResposta,
          style: const TextStyle(fontSize: 28),
        )),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ],
    );
  } 
...
```
6:09
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
No `onPressed`, ***Ex.:*** `onPressed: quandoReiniciarQuestionario,` a ***Função*** `quandoReiniciarQuestionario` é chamada diretamente por não possuir parâmetro, por esse motivo, ela não precisa ser chamada através de uma ***Função Arrow*** `() =>`

7:19
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
### Conclusão:

Agora é possível voltar e reiniciar o formulário quantas vezes forem necessários, nesse caso foi feita uma ***Comunicação Indireta***, foi passado uma ***Função*** de *Comunicação Direta* para o ***Componente Filho*** (o componente pai passando para o componente filho) e no *Componente Filho* a ***Função*** foi invocada de tal forma que conseguiu chamar o *Comportamento no Pai*.

Nesse caso, não foi passado nenhum parâmetro mas poderia ter sido passado.

7:20
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
### Código do arquivo Main:
```
// ignore_for_file: use_key_in_widget_constructors
 
import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
 
main() => runApp(PerguntaApp());
 
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
 
//   Cria a Lista de Perguntas e Respostas
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'vermelho', 'pontuacao': 5},
        {'texto': 'verde', 'pontuacao': 3},
        {'texto': 'branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ]
    },
  ];

  // O _Método_ _responder() vai receber por parâmetro a pontuação do usuário.
  void _responder(int pontuacao) {
    //  Evita mudanças de estado desnecessárias.
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        // Soma o valor do parâmetro pontuacao com o valor da
        //Variável Global _pontuacaoTotal .
        _pontuacaoTotal += pontuacao;
      });
    }
 
    // ignore: avoid_print
    print(_perguntaSelecionada);
    print(_pontuacaoTotal);
  }
 
  // Os dois valores foram reinicializados para seus valores inicial.
  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  // _Método_ Getter
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
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
```
7:32
###### 2. Noções básicas de Flutter
###### 70. Reiniciando Questionário
### Código do arquivo Resultado:
```
import 'package:flutter/material.dart';
 
class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
 
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);
 
  String get fraseResposta {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!!!';
    } else {
      return 'Nível Jedi!!!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          fraseResposta,
          style: const TextStyle(fontSize: 28),
        )),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text('Reiniciar?'),
        ),
      ],
    );
  }
}
```
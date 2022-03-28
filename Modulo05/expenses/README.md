# SUMÁRIO<a name='sumario'></a>

* [Calculando Dinamicamente a Altura da Tela - Aula 143](#calculando-dinamicamente-altura-tela)
    * [Definindo o Cálculo da Altura Disponível - Aula 143](#definindo-calculo-altura-disponivel)
    * [Código do exercício de hoje: - Aula 143](#codigo-do-exercicio-hoje-aula-143)
* [](#)
* [](#)


# MÓDULO 5
>O Módulo 5 possui o mesmo projeto de Despesas Pessoais que será atualizado com as Aulas do Módulo 5 do Curso de Flutter.

## Calculando Dinamicamente a Altura da Tela <a name='calculando-dinamicamente-altura-tela'></a>

#### [^Sumário^](#sumario)

Neste momento iniciamos a ***Responsividade do App***, e para tal, iremos usar o ***Componente MediaQuery()*** para poder receber dinamicamente o tamanho da tela e de alguns Componentes, para então poder calcular a ***Altura Disponível*** para ser usada.

Para que possamos receber os valores que precisamos dinamicamente, iremos usar o `MediaQuery` e através do Método estático `.of(context),` passar as informações necessárias para que ele saiba onde está, já que o contexto ***(context) "buildContext"*** diz exatamente qual Componente está sendo renderizado.

>*E existe uma relação entre o Componente Pai e o Componente Filho, ou seja, o contexto (context) do Filho consegue acessar o Componente Pai que assim consegue acessar os Componentes da Árvore de Componentes. Então, o contexto (context) é uma parte importante na hora de se entender onde a Aplicação está executando e a partir daí conseguir inferir informações importantes.*

Então, colocando mais um ***. PONTO*** irá aparecer uma lista de opções, desde a densidade da tela com o ***.devicePixelRatio***, tem como desabilitar a animação do App ***.disableAnimations*** caso o Usuário tenha habilitado essa opção no aparelho *(respeitando assim a vontade do mesmo)*, mas a opção que iremos usar é o ***tamanho do dispositivo*** `.size` e no tamanho teremos a largura mas o que queremos é a altura com `.height`, com isso, teremos a ***Altura Total da Tela do Dispositivo***, mas, ainda não é o que precisamos, pois, ainda existe os itens do sistema, tais como: Barra de Status, AppBar e em alguns dispositivos a Barra de Navegação, e tudo isso deve ser levado em conta na hora de se fazer o calculo da ***Altura Disponível***.

Dentro do ***build()*** no Método ***main.dart*** será definido uma variável do Tipo `final` com nome de ***Altura Disponível*** `availableHeight` que recebe `=` o Componente `MediaQuery` passando o Método Estático `.of(context)` chamando o `.size` logo após, definindo a altura `.height;`, essa é a ***Altura Disponível Inicial***.

```
main.dart
 
...
    final availableHeight = MediaQuery.of(context).size.height;
...
```

Além de se saber a ***Altura Total da Tela*** através do `MediaQuery.of(context).size.height;` precisamos considerar a ***Altura da Barra de Título*** `appBar.preferredSize.height` e a ***Altura da Barra de Status***, `MediaQuery.of(context).padding.top` para poder saber a ***Altura Disponível.***

Para poder pegar a ***Altura da Barra de Título*** `AppBar`  iremos definir uma variável do Tipo `final` com o nome de `appBar` que irá receber `=` o Componente `AppBar` definido no atributo ***appBar:*** dentro do ***Scaffold()***.

```
main.dart
 
...
    //todo: Coloca o Componente AppBar dentro da variável appBar
    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
...
```

## Definindo o Cálculo da Altura Disponível <a name='definindo-calculo-altura-disponivel'></a>

#### [^Sumário^](#sumario)

Iremos pegar a variável `final availableHeight` recebendo `=` a ***Altura Total Disponível*** `MediaQuery.of(context).size.height` e subtraindo `-` a **Altura do AppBar** `appBar.preferredSize.height` e subtraindo `-` a ***Altura da Barra de Status*** `MediaQuery.of(context).padding.top`.

>****Dica:*** um sinal de que os 100% da tela está definido corretamente "levando em consideração a Barra de Títulos, a Barra de Status e talvez a Barra de Tarefas, dependendo de algum aparelho" é o App "no caso o ***Scaffold()***" não fazer mais scroll.*

## Código do exercício de hoje: <a name='codigo-do-exercicio-hoje-aula-143'></a>

#### [^Sumário^](#sumario)

```
main.dart 
 
...
 @override
  Widget build(BuildContext context) {
    //todo: Coloca o Componente AppBar dentro da variável appBar
    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
 
    //todo: Calcula a Altura Disponível da Tela;
    //todo: 1 - Pega a Altura Total da Tela;
    //todo: 2 - Subtrai a Altura do AppBar;
    //todo: 3 - Subtrai a Altura da Barra de Status.
    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
 
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //* Filtra as Transações Recentes
            Container(
              height: availableHeight * 0.4,
              child: Chart(_recentTransactions),
            ),
            //* Comunicação Direta -> através de Dados
            Container(
              height: availableHeight * 0.6,
              child: TransactionList(_transactions, _removeWhere),
            ),
          ],
        ),
      ),
...
```

##
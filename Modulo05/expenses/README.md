# SUMÁRIO<a name='sumario'></a>

* [Calculando Dinamicamente a Altura da Tela - Aula 143](#calculando-dinamicamente-altura-tela)
  * [Definindo o Cálculo da Altura Disponível - Aula 143](#definindo-calculo-altura-disponivel)
  * [Código do exercício de hoje: - Aula 143](#codigo-do-exercicio-hoje-aula-143)
  * [Usando Responsividade no Texto - Aula 144](#usando-responsividade-no-texto)
  * [Responsividade do ChartBar com LayoutBuilder - Aula 145](#responsividade-chartbar-layoutbuilder)
  * [Definindo a Orientação do APP - Aula 146](#definindo-orientacao-do-app)
* [](#)
* [](#)

============================================================

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

## Usando Responsividade no Texto <a name='usando-responsividade-no-texto'></a>

#### [^Sumário^](#sumario)

Para que um texto no APP possa aumentar ou diminuir conforme a escolha do Usuário nas configurações do aparelho, precisamos usar o ***Componente MediaQuery.of(context).textScaleFactor***.

Sendo assim, quando o Usuário escolher nas configurações do aparelho entre fontes grandes, pequenas e normais, o APP terá seus textos modificados, mas isso ocorrerá somente onde o ***Componente MediaQuery*** foi definido.

E para que isso ocorra, é preciso que o tamanho da fonte `fontSize:` que você definiu `10` seja multiplicado `*` por `MediaQuery.of(context).textScaleFactor,` como no exemplo a seguir:

```
main.dart
 
...
    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * MediaQuery.of(context).textScaleFactor,
        ),
      ),
...
```

>Acredito que o Dart já faça isso automaticamente, pois, no teste de responsividade, percebi que outros componentes além do que definimos, também estavam sendo modificados, mesmo sem terem sidos definidos para tal.

## Responsividade do ChartBar com LayoutBuilder <a name='responsividade-chartbar-layoutbuilder'></a>

#### [^Sumário^](#sumario)

Para poder usar a responsividade no ***Componente ChartBar*** para que ele possa considerar o tamanho *"no caso altura"* do Componente que está envolvido, *"no caso o Componente Chart"*.

Para isso é usado o ***Componente LayoutBuilder*** através do atributo `builder:` usando uma Função que retornará parte da interface.

No momento que esta Função é chamada, é passado um contexto `(ctx,` e no caso do ***LayoutBuilder*** algumas ***restrições*** `constraints)` e nesta ***restrição constraint*** se consegue ter acesso aos ***tamanhos***, *(altura, largura, etc.)* e isso nos ajuda a construir uma interface responsiva.

Agora iremos definir a responsividade nos Componentes dentro do ChartBar.

Abra o Componente ChartBar() ***chart_bar.dart***, lá no ***build()*** iremos encontrar todos os Componentes que compõe o ChartBar e se prestar um pouco de atenção, notará que as alturas ***height:*** estão fixas impossibilitando a responsividade do Componente.

Inicialmente iremos aumentar a ***Altura do Container*** que contém a Barra do Gráfico, mas para isso não podemos usar o Tamanho da Tela como fizemos anteriormente com o ***MediaQuery()***, pois, precisamos usar o tamanho do Contexto em que ele está inserido, que em nosso caso é o ***ChartBar()***.

Mas para que possamos fazer isso, precisamos envolver a `Column()` com um *Widget* ***CTRL + PONTO*** *Wrap with widget* e renomeie para `LayoutBuilder(){...}` ele irá receber um ***atributo*** `builder:` que receberá uma ***Função*** `() {...}` e esta Função irá ***retornar*** `return` a nossa ***coluna*** `Column()`, este é o Componente que nos permite realizar as alterações que precisamos pra tornar o ***ChartBar()*** responsivo.

No momento que esta Função é chamada, é passado um ***contexto*** `(ctx,` e algumas ***restrições*** `constraints)` e nesta ***restrição constraint*** se consegue ter acesso aos ***tamanhos***, `(altura, largura, etc.)`.

```
chart_bar.dart
 
...
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: LayoutBuilder(
        builder: (ctx, Constraints) {
          return Column(
            children: [
              //*todo: Valor Transação
              Container(
                height: 20,
                child: FittedBox(
                  child: Text('${value.toStringAsFixed(2)}'),
                ),
              ),
              const SizedBox(height: 5),
              //*todo: Barra Cinza
              Container(
                height: 60,
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
              const SizedBox(height: 5),
              //*todo: Dia da Semana
              Container(
                height: 20,
                child: Text(label),
              ),
            ],
          );
        },
      ),
    );
  }
}
```

Agora iremos realmente alterar a ***Altura do Container*** que corresponde a ***Barra Cinza***, no ***atributo*** `height:` iremos definir a ***Altura Máxima*** `constraints.maxHeight` multiplicando `*` por `0.6,` que corresponde a ***60%*** da altura do ***Componente ChartBar()***.

>Para que a responsividade funcione corretamente, todos os Componentes do ***ChartBar()*** precisam estar definidos com ***valores percentual*** e não com valores fixos.

Isso pode gerar problemas dependendo do tamanho do ***Card()***, ***60% 0.6*** é um tamanho adequado para a ***Barra Cinza***.

Agora vamos definir os valores pela ordem dos Componentes no ChartBar();

* 15% no Container ***Valor da Transação***: `height: constraints.maxHeight * 0.15,`;
* 5% no ***SizedBox***: `(height: constraints.maxHeight * 0.05),`;
* 60% no Container ***Barra Cinza***: `height: constraints.maxHeight * 0.6,`;
* 5% no ***SizedBox***: `(height: constraints.maxHeight * 0.05),`;
* 15% no Container ***Dia da Semana***: `height: constraints.maxHeight * 0.15,`.

Para garantir que o ***Dia da Semana*** seja escalado corretamente, precisamos envolver o ***Componente Text()*** com um ***Widget*** `Wrap with widget` e renomear para ***FittedBox()*** para que o texto seja escalado.

Com esses valores, definimos completamente o ***Componente ChartBar()***, para que o mesmo fique responsivo e bastando apenas definir em ***main.dart*** a ***percentagem da altura*** dos Componentes `Chart()` e `TransactionList()`.

## Definindo a Orientação do APP <a name='definindo-orientacao-do-app'></a>

#### [^Sumário^](#sumario)

Em algumas situações e Aplicações é conveniente que a Orientação da Aplicação seja travada ou definida em uma certa posição.

Para tal, no Método `build(){...}` do Componente principal da Aplicação deve se definir o seguinte Componente:

`SystemChrome` e existe um Método `.setPreferredOrientations(` que recebe um Array `[`  de orientações `DeviceOrientation` que possui diversos ***Métodos*** relacionados a ***Orientação do Dispositivo*** e um desses ***Métodos*** é o `.portraitUp]);` que é a Orientação Retrato para Cima e para usar este Componente, devemos ***importar*** `import 'package:flutter/services.dart';`

```
main.dart

...
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
        ]);
...
```

##
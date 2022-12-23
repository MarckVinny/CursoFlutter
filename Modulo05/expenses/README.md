# SUMÁRIO<a name='sumario'></a>

* [Calculando Dinamicamente a Altura da Tela - Aula 142](#calculando-dinamicamente-altura-tela)
  * [Definindo o Cálculo da Altura Disponível - Aula 142](#definindo-calculo-altura-disponivel)
  * [Código do exercício de hoje: - Aula 142](#codigo-do-exercicio-hoje-aula-143)
  * [Usando Responsividade no Texto - Aula 143](#usando-responsividade-no-texto)
  * [Responsividade do ChartBar com LayoutBuilder - Aula 144](#responsividade-chartbar-layoutbuilder)
  * [Definindo a Orientação do APP - Aula 145](#definindo-orientacao-do-app)
  * [Alternando entre Chart() e TransactionList() - Aula 146](#alternando-chart-transactionlist)
  * [Refatorando TransactionList() Responsividade - Aula 147](#refatorando-transactionlist-responsividade)
  * [Ajustando o Gráfico no Modo Paisagem - Aula 148](#ajustando-grafico-modo-paisagem)
  * [Mudando o Switch por um Botão de Ícone - Aula 149](#mudando-switch-botao-icone)
    * [Código da Aula - Aula 149](#codigo-aula-149)
  * [Ajustando Modal do Formulário - Aula 150](#ajustando-modal-formulario)
    * [A lógica que abordaremos será a seguinte: - Aula 150](#logica-abordada-aula-150)
    * [Códigos da Aula - Aula 150](#codigo-aula-150)
  * [Definindo Condicional Relacionada à Largura do Dispositivo - Aula 151](#definindo-confidencial-relacionada-largura-dispositivo)
    * [Código da Aula - Aula 151](#codigo-aula-151)
  * [Refatorando o MediaQuery() - Aula 152](#refatorando-media-query)
* [Detectando a Plataforma (Android, iOS, Windows, etc.) - Aula 153](#detectando-plataforma-aula-154)
  * [Correção Componente iOS - Aula 154](#correcao-componente-ios-aula-154)
  * [Refatorando Componentes iOS e Android - Aula 155](#refatorando-componente-ios-android-aula-155)
  * [Conhecendo o Componente SafeArea() - Aula 156](#conhecendo-safearea-aula-156)
  * [Definindo um Botão Adaptativo - Aula 157](#botao-adaptativo-aula-157)
  * [Definindo um TextField Adaptativo - Aula 159](#text-field-adaptativo-aula-159)
  * [Definindo um DatePicker Adaptativo - Aula 160](#date-picker-adaptativo-aula-160)
    * [Inicio da Definição do Componente Android: - Aula 160](#definindo-componente-android-aula-160)
    * [Definição do Componente iOS: - Aula 160](#componente-ios-aula-160)
    * [Código Completo - Aula 160](#codigo-completo-aula-160)

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

## Alternando entre Chart() e TransactionList() <a name='usando-responsividade-no-texto'></a>

#### [^Sumário^](#sumario)

A estratégia será definir um ***Switch***, que irá fazer a alternância entre o ***Gráfico*** `Chart()` e a ***Lista de Transações*** `TransactionList()`.

Em ***main.dart***,  dentro do Componente `_MyHomePageState{}` que é um Componente Statefulwidget dentro do `Scaffold()` e dentro de `body: SingleChildScrollView()` onde tem os Filhos `children:` da coluna `Column()`, tem o `Container()` do Componente `Chart()` e o `Container()` do Componente `TransactionList()` e a ideia inicial é fazer a alternância entre esses dois Componentes.

>Até esse ponto, não está sendo considerado se está ou não no ***Modo Paisagem***, mas, mais adiante será considerado para que só exiba esta opção caso o ***Dispositivo esteja no Modo Paisagem***, mas, por enquanto estará disponível para a aplicação inteira *(em todos os Modos)*.

Continuando `_MyHomePageState{}` -> `Scaffold()` -> `body: SingleChildScrollView()` -> `children: [`  existe um Componente chamado `Switch(` onde temos o atributo ***valor*** `value:` que pode ter seu ***valor*** como `true,` e temos outro atributo que é o Método `onChange:` esse Método recebe uma Função `(` que recebe por parâmetro um ***novo valor*** `value){...})`.

Como a ***coluna*** `Column()` possui o atributo `crossAxisAlignment: CrossAxisAlignment.stretch,` ele ficará muito esticado e ficará estranho, então, iremos envolver o `Switch()` ***CTRL+PONTO*** com uma *Linha* ***Row*** `Wrap with Row` e com isso podemos também colocar um texto ao lado do ***Switch***, para isso, iremos definir nos ***Filhos*** `children:` desta *Linha* ***Row***, um texto chamado `Text('Exibir Gráfico'),` e para que o texto e o ***switch*** fiquem centralizados na *Linha* ***Row***, iremos definir o atributo `mainAxisAlignment: MainAxisAlignment.center,` logo abaixo de ***Row()***.


```
main.dart

...
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Exibir Gráfico'),
                //* Controle deslizante
                Switch(
                  value: _showChart,
                  onChanged: (value) {
                    setState(() {
                      _showChart = value;
                    });
                  },
                ),
              ],
            ),
...
```

E a ideia, é quando estiver marcado aparece o ***Gráfico*** e quando tiver desmarcado aparece a ***Lista de Transações***.

Para fazer isso, precisamos vincular o valor do ***Switch()*** `value:` com uma variável dentro do Estado deste Componente, então, em `_MyHomePageState{}` iremos definir a variável `bool` de nome Exibir Gráfico `_showChart`  recebendo `=` o valor `false;` no caso desativado.

```
main.dart

...
class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;
...
```

E esta variável será ligada no ***valor*** `value:` substituindo ***verdadeiro*** `true,` que ficará assim: `value: _showChart,` e no `onChange: (value){` será usado o `setState((){` para chamar o `_showChart` que recebe `=` o valor `value;});})])`, que foi recebido no Método `onChange:`.

Então, sempre que o ***Switch mudar***, o Método ***onChange:*** será chamado, passando o novo valor ***(value)*** e o novo valor ***value;*** será persistido no ***_showChart*** dentro de um ***setState()***.

Agora para que as alterações apareçam na Tela, será preciso fazer uma renderização condicional para alternar entre o ***Gráfico*** e a ***Lista de Transações***.

Anteriormente em ***transaction_list.dart*** usamos ***Operação Ternária*** para fazer isso, mas desta vez iremos usar uma abordagem diferente, iremos utilizar ***if()***.

Então, iremos definir antes dos Containers `Chart()` e `TransactionList()`:

Se `if(_showChart)` ***for verdadeiro*** `true` mostra Container `Chart()`,

Se `if(!_showChart)` ***não for verdadeiro*** `false`, mostra Container `TransactionList()`,

```
main. dart

...
        //* Filtra as Transações Recentes
        //? Se _showChart for true mostra o Chart()
        if (_showChart)
          Container(
            height: availableHeight * 0.35,
            child: Chart(_recentTransactions),
          ),
        //* Comunicação Direta -> através de Dados
        //? Se !_showChart for false, mostra TransactionList()
        if (!_showChart)
          Container(
            height: availableHeight * 0.65,
            child: TransactionList(_transactions, _removeWhere),
          ),
...
```

>***Dica:*** um sinal de exclamação ***"!"*** antes de uma variável booleana bool significa negação ou seja tem valor contrário de true que no caso é false.

A vantagem de se usar o `if()` ao invés de usar uma ***Operação Ternária*** `? :` , é que no ***if()*** podemos usar expressões mais complexas, inclusive expressões diferentes para cada componente.

Já na ***Operação Ternária***, se precisa ter um ou o outro para que a operação aconteça.

Já usando o ***if()***, podemos exibir a ***Row()*** somente se estiver no ***Modo Paisagem***, então, podemos ter uma certa independência na lógica que será abordada en cada Componente.

Posteriormente podemos substituir esse controle deslizante por um botão na barra de Título que alternará entre um ícone de Gráfico e um ícone de Lista.

## Refatorando TransactionList() Responsividade <a name='refatorando-transactionlist-responsividade'></a>

#### [^Sumário^](#sumario)

Como nos Componentes anteriores, também iremos usar o Componente ***LayoutBuilder()*** para poder ajustar a imagem de quando não tem nenhuma transação cadastrada.

Anteriormente foi usado o ***MediaQuery()*** para fazer esse ajuste, mas como já aprendemos a usar o ***LayoutBuilder()*** iremos usar este Componente.

Antes usamos o ***Padding()*** para poder dar espaço entre os Componentes, mas iremos voltar ao padrão proposto, e iremos usar o ***SizedBox()*** para poder dar espaço entre os Componentes posto isso, as definições ficaram da seguinte forma:

* Envolver toda a ***coluna*** `Column()` em `Widget` ***CTRL+PONTO*** `Wrap with widget` e renomear para `LayoutBuilder()`;

* Definir o atributo `builder:` e adicionar o ***contexto*** `(ctx,` e as ***restrições*** `constraints) {...}`;

* Dentro das ***chaves*** `{` irá ***retornar*** `return` todo o conteúdo da coluna `Column()`;

* Antes de ***Text()*** adicionar um `SizedBox(` definindo o atributo `height:` com a restrição `constraints` altura máxima `.maxHeight` multiplicado `*` por 5% da altura do Componente `0.05),`;

* Iremos envolver o ***Text()*** com um `Container()` ***CTRL+PONTO*** `Wrap with container` e definir o atributo de altura `height:` com a restrição `constraints` altura máxima `.maxHeight` multiplicado `*` por 30% da altura do Componente `0.3),`;

* Após o ***Text()*** repetir o mesmo procedimento do ponto anterior, sendo assim, será: `SizedBox()` -> `Text()` -> `SizedBox()`;

* Após o segundo ***SizedBox()*** vem o `Container()` que contém a imagem quando não há nenhuma transação cadastrada, com isso iremos adicionar o atributo de altura `height:` com a restrição `constraints` altura máxima `.maxHeight` multiplicado `*` por 60% da altura o Componente `0.6,`.

## Código da Aula de hoje <a name='codigo-aula-148'></a>

#### [^Sumário^](#sumario)

```
transaction_list.dart
 
...
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.3,
                  child: Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            );
          }))
...
```

## Ajustando o Gráfico no Modo Paisagem <a name='ajustando-grafico-modo-paisagem'></a>

#### [^Sumário^](#sumario)

Para que o gráfico ***Chart()*** apareça corretamente no ***Modo Paisagem*** `Orientation Landscape`, precisaremos definir uma variável ***booleana*** `bool` que irá verificar se o Dispositivo está ou não no ***Modo Paisagem***:

* Logo no início do Método `build(){...}` iremos definir uma variável do Tipo ***booleana*** `bool` de nome `isLandscape` que irá receber `=` `MediaQuery.of(context)` com a propriedade `.orientation` e iremos comparar se é igual `==` ao Modo Paisagem `Orientation.landscape;` e estando no ***Modo Paisagem*** a variável ***isLandscape*** retornará ***true.***;

* Então, somente será mostrado o ***switch*** para habilitar o gráfico, se o aparelho estiver no Modo Paisagem e para isso iremos definir `if(isLandscape)` se está no Modo Paisagem, antes do Componente `Row()`;

* Para que o ***Gráfico*** e a ***Lista de Transações*** apareçam no Modo Retrato e NÃO apareça o switch, precisamos fazer uma checagem no Componente `Chart()` e no Componente `TransactionList()`:

* Antes do Componente `Chart()` ficará assim `if (_showChart || !isLandscape)`;

* Antes do Componente `TransactionList()` ficará assim `if (!_showChart || !isLandscape)`;

* Agora para resolver o erro de não estar aparecendo corretamente o Gráfico no Modo Paisagem, iremos usar a variável ***isLandscape*** para definir o ***percentual de altura*** do Gráfico:

```
main.dart

...
    //* Filtra as Transações Recentes
    //? Se _showChart for true mostra o Chart()
    //? ou || se não estiver no Modo Paisagem !isLandscape
    if (_showChart || !isLandscape)
        Container(
        //todo: Se estiver no Modo Paisagem isLandscape
        //todo: ? multiplica Altura Disponível por 0.7
        //todo: ? multiplica Altura Disponível por 0.35
        height: availableHeight * (isLandscape ? 0.7 : 0.35),
        child: Chart(_recentTransactions),
        ),
    //* Comunicação Direta -> através de Dados
    //? Se !_showChart for false, mostra TransactionList()
    //? ou || se não estiver no Modo Paisagem !isLandscape
    if (!_showChart || !isLandscape)
        Container(
        height: availableHeight * (isLandscape ? 1 : 0.65),
        child: TransactionList(_transactions, _removeWhere),
        ),
...
```

## Mudando o Switch por um Botão de Ícone <a name='mudando-switch-botao-icone'></a>

#### [^Sumário^](#sumario)

Nesta aula iremos adicionar um botão na Barra de Títulos que irá alternar entre mostrar o Gráfico e mostrar a Lista de Transações.

Primeiro iremos adicionar mais um ícone `IconButton()` na ***Barra de Título*** antes do ícone de ***Adicionar Transação***.

No `onPressed:` iremos utilizar uma Função `() {...}` para controlar o Estado do Botão que irá alternar entre o ícone da Lista e o ícone do Chart;

* Dentro das chaves `{` iremos definir o ***setState()*** que irá controlar o Estado do Botão, `setState(() {` definindo a variável true `_showChart`  que receberá `=` a variável false `!_showChart});`. Na lógica, ***se for verdadeiro*** true, mostra o Chart ***_showChart*** e ***se "não for verdadeiro"*** false ***!_showChart*** mostra a lista.

* Agora iremos adicionar o atributo `icon:` com a propriedade `Icon(` Se `_showChart` for verdadeiro true `?` mostra o ícone da Lista `Icons.list` Se for falso false `:` mostra o ícone do Chart `Icons.bar_chart),`.

* O que irá controlar se o ícone irá ou não aparecer no ***Modo Paisagem*** é a variável `isLandscape` que deverá ser definida antes do Componente `IconButton()` que acabamos de definir.

* E para finalizar podemos comentar ou simplesmente excluir o Componente ***Row()*** que se encontra dentro de ***Scaffold()*** para que o ***Switch()*** não fique mais sendo exibido no App.

### Código da Aula: <a name='codigo-aula-149'></a>

#### [^Sumário^](#sumario)

```
main.dart
 
...
    //? Mostra o ícone, Se estiver no Modo Paisagem "isLandscape"
    if (isLandscape)
        IconButton(
        //? Se _showChart for verdadeiro true
        //? Mostre ? o ícone de Lista
        //? Senão : mostre o ícone de Gráfico
        icon: Icon(_showChart ? Icons.list : Icons.bar_chart),
        onPressed: () {
            //todo: muda os ícones,
            //todo: Se verdadeiro mostra o Gráfico _showChart
            //todo: Se falso mostra a Lista !_showChart
            setState(() {
            _showChart = !_showChart;
            });
        },
        ),
...
```

## Ajustando Modal do Formulário <a name='ajustando-modal-formulario'></a>

#### [^Sumário^](#sumario)

Atualmente o Formulário que é criando através de um Modal, possui um problema que quando se clica em um ***TextField()*** o teclado abre por cima do Modal escondendo parte do Formulário.

Na aula de hoje, veremos uma forma simples de resolver esse problema, mas em aulas futuras, voltaremos a esse assunto com uma abordagem mais profunda e avançada.

>***Dica:*** Mas, no link a seguir, tem Modal melhorado http://encurtador.com.br/szIQ2

### A lógica que abordaremos será a seguinte: <a name='logica-abordada-aula-150'></a>

#### [^Sumário^](#sumario)

* Detectar o tamanho do teclado, para poder somar o tamanho do teclado + 10 de padding na parte de baixo;

* Em ***transaction_form.dart*** vamos envolver o `Card()` com um `Widget` ***CTRL+PONTO*** `Wrap with widget` e renomear para `SingleChildScrollView()`;

* Alterar o `padding: EdgeInsets.all(7),` para `EdgeInsets.only(top: 7, right: 7, left: 7, bottom: 7 + o Tamanho do Teclado através de MediaQuery.of(context).viewInsets.bottom,),`. O `viewInserts` seriam as dimensões da View e quando o teclado sobre, a View fica menor e o espaço que o teclado ocupa é o `.bottom`. E somando com 7 vai dar um padding: com essas dimensões associado ao `Card()` que representa o Formulário;

* E para terminar, dentro de main.dart em `showModalBottomSheet()` acrescentar a linha `isScrollControlled: true,` para habilitar o ***scroll do Modal***.

### Códigos da Aula <a name='codigo-aula-150'></a>

#### [^Sumário^](#sumario)

```
transaction_form.dart
 
...
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 7,
            right: 7,
            left: 7,
            bottom: 7 + MediaQuery.of(context).viewInsets.bottom,
          ),
...
```

```
main.dart
 
...
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        //todo: habilita o scroll
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }
...
```

## Definindo Condicional Relacionada à Largura do Dispositivo <a name='definindo-confidencial-relacionada-largura-dispositivo'></a>

#### [^Sumário^](#sumario)

Iremos atribuir uma condicional para que apareça uma Label ao lado do ícone de excluir transação, para que quando estiver em um Dispositivo de Tela Maior que o tamanho que definimos, apareça a Label ou qualquer outra Função que venhamos a desejar.

### A lógica será a seguinte:

* Associado ao ***Botão Excluir Transação***, será adicionado uma ***Label*** caso a Largura seja maior que determinado tamanho;

* A princípio, essa ***Label*** só irá aparecer em Telas Largas ou no Modo Paisagem;

* A checagem não será feita para saber se o Dispositivo está ou não no Modo Paisagem ***"isLandscape"***;

* Essa checagem será feita dentro do `trailing:` que fica dentro do `ListTiled()` dentro do `Card()`.

Agora, abra o arquivo transaction_list.dart e dentro de `Widget build()` -> `ListView.builder()` -> `Card()` -> `child: ListTiled()` -> `trailing:` e a partir de ***trailing:*** iremos fazer a checagem do tamanho da tela:

* Iremos pegar a Largura através de `MediaQuery.of(context).size.width` se a Largura for maior `>` que `480`;

* Mostra `?` o `TextButton.icon()` caso contrário `:` mostra o ícone padrão `IconButton()`;

* Será mostrado o ícone padrão **"Lixeira"** se a Largura for menor que 480 e um `TextButton()` com a Label junto com a Lixeira se a Largura for maior que 480;


### Código da Aula: <a name='codigo-aula-151'></a>

#### [^Sumário^](#sumario)

```
transaction_list.dart
 
...
    trailing: MediaQuery.of(context).size.width > 420
        ? TextButton.icon(
            onPressed: () => onRemove(tr.id),
            icon: Icon(Icons.delete_forever_outlined,
                color: Theme.of(context).errorColor),
            label: Text(
            'Excluir',
            style:
                TextStyle(color: Theme.of(context).errorColor),
            ),
        )
        : IconButton(
            onPressed: () => onRemove(tr.id),
            icon: const Icon(Icons.delete_forever_outlined),
            color: Theme.of(context).errorColor,
        ),
),
...
```

## Refatorando o MediaQuery() <a name='refatorando-media-query'></a>

#### [^Sumário^](#sumario)

Para otimizar o código e evitar de ficar reconstruindo o `MediaQuery.of(context)` toda vez que for chamado, iremos definir uma ***Constante do Tipo Final*** `final` de nome `mediaQuery` para armazenar este Método e iremos chamar esta Constante ao invés de chamar o Método mais de uma vez.

```
main.dart

...
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
...
```

## Detectando a Plataforma (Android, iOS, Windows, etc.) <a name='detectando-plataforma-aula-153'></a>

#### [^Sumário^](#sumario)

>### ***A partir desde ponto, precisaríamos de um dispositivo Apple para poder testar os códigos a seguir, na Vídeo Aula do Curso de Flutter da [COD3R](http://www.cod3r.com.br), o Professor Leonardo Moura, utilizou um dispositivo pra fazer os testes "coisa que não possuo no momento". Então só irei repassar sem testar os códigos, pois, nem mesmo consegui encontrar um emulador para iPhone para efetuar os testes.***

Primeiramente para que possamos definir, como e se um determinado Componente irá comportar em determinada Plataforma.

Vamos usar um exemplo do Componente `Switch()`, nele existe um Construtor Nomeado chamado `.adaptive()` que em outras palavras adapta o Componente dependendo em que Plataforma o App está sendo rodado.

Também podemos definir que o `Switch()` tenha a mesma cor do Thema que estamos usando no App que no caso é:  `activeColor: Theme.of(context).colorScheme.secondary,`.

Dessa forma definimos o `activeColor:` tanto para o Android quanto para o iOS.

```
main.dart
 
...
        Switch.adaptive(
        activeColor: Theme.of(context).colorScheme.secondary,
        value: _showChart,
        onChanged: (value) {
            setState(() {
            _showChart = value;
            });
        },
        ),
    ],
    ),
...
```

Agora sim, iremos identificar qual Plataforma o App está rodando e usar uma definição diferente para um determinado Componente.
Isso fale para qualquer uma das Plataformas suportadas pelo Dart.

Para que possamos identifica a Plataforma, primeiro precisamos importar a Biblioteca dart:io `import 'dart:io';`

Neste Exemplo, iremos ocultar o ***floatActionButton()*** no iOS, pois a Plataforma não utiliza esse tipo de botão.

Para isso, iremos utilizar uma ***Função Ternária*** que irá verificar se estamos no iOS `Platform.isIOS`, se estivermos irá `?` mostrar um Container vazio `Container() :` caso contrário estamos no Android e irá mostrar o `floatActionButton();`

```
main.dart
 
...
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _openTransactionFormModal(context),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
...
```

Essas a princípio são as duas formas de se fazer com que o mesmo Componente seja renderizado de maneiras distintas e nativas na Plataforma em que estiver rodando.

Podemos usar o ***Método Adaptativo***, fazendo com que o Flutter se encarregue automaticamente da conversão do Componente.

Ou usando a ***Biblioteca Dart IO*** e Definindo manualmente o comportamento do Componente.

## Correção Componente iOS <a name='correcao-componente-ios-aula-154'></a>

#### [^Sumário^](#sumario)

### Fala pessoal!

Na próxima aula, faremos algumas correções por conta das atualizações do Flutter 2. A primeira delas se trata da refatoração da ***AppBar***, o ***PreferredSizeWidget*** não funciona mais com a ***CupertinoNavigationBar***, então é necessário deixar essa parte do código lá no local dela mesmo, ao invés de refatorar como na aula. Ficará assim:

```
return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
            child: bodyPage,
          )
```

A outra correção se trata da refatoração dos botões. Uma pequena mudança vai ser necessária da definição da função de refatoração. Será necessário adicionar ***()*** na Function que é parâmetro. Deixando o código assim:

```
Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }
```

## Refatorando Componentes iOS e Android <a name='refatorando-componente-ios-android-aula-155'></a>

#### [^Sumário^](#sumario)

Neste tópico estaremos refatorando os Componentes para que seja apresentado visualmente de forma correta tanto em um dispositivo iOS usando o `Cupertino()` quanto em um dispositivo Android usando o `Material()`.

Para iniciar vamos começar pelo componente principal da Aplicação, iremos criar uma Função Ternária que irá verificar se é um dispositivo iOS `Platform.isIOS` e se for `?` usa `CupertinoPageScaffold()` se não for `:` usa `Scaffold()`.

Se o VS Code não fizer automaticamente, não esquece de importar o a biblioteca do Cupertino.

```
import 'package:flutter/cupertino.dart';
```

Existe uma peculiaridade em relação as Nomenclaturas, enquanto no `CupertinoPageScaffold()` temos um atributo `child:` no `Scaffold()` temos um atributo `body:` e isso pode causar problemas na hora de renderizar corretamente, por isso, iremos pegar todo o Componente `SingleChildScrollView()` e colocar dentro de uma constante chamada `bodyPage` que será referenciada tanto no ***child:*** quanto no ***body:***.

```
main.dart
 
...
final bodyPage = SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
        if (_showChart || !isLandscape)
        Container(
            height: availableHeight * (isLandscape ? 0.7 : 0.35),
            child: Chart(_recentTransactions),
        ),
        if (!_showChart || !isLandscape)
        Container(
            height: availableHeight * (isLandscape ? 1 : 0.65),
            child: TransactionList(_transactions, _removeWhere),
        ),
    ],
    ),
);
 
   return Platform.isIOS
        ? CupertinoPageScaffold(child: bodyPage)
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
...
```

Continuando a refatoração, assim como antes os atributos `navigationBar:` e `appBar:` possuem a mesma função a de definir a Barra de Títulos.

No atributo `navigationBar:` também será usado a constante `appBar`, mas, será preciso criar um `appBar` condicional.

Lá onde foi definida a constante ***appBar*** deverá ser feito uma alteração que todo ***appBar*** precisa ser do Tipo `PreferredSizeWidget` que será mostrada a seguir:


```
    //todo: Coloca o Componente AppBar dentro da variável appBar
    final PreferredSizeWidget appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: actions,
    );
```
Assim como o `appBar:` implementa esta interface e o `CupertinoNavigationBar:` faz a mesma coisa, então, mais uma vez iremos implementar uma Função Ternária que verificará se é ou não iOS `Platform.isIOS` se for `?` mostra `CupertinoNavigationBar()` caso contrário `:` mostra `AppBar()`.

Assim como no CupertinoPageScaffold() o CupertinoNavigationBar() possui algumas diferenças em comparação ao AppBar().

O Título é definido através do atributo `middle:` que conterá o texto `Text('Despesas Pessoais'),` e relacionado as actions, ele não possui este atributo e sim um `trailing:` onde são colocados os botões de ação dentro de uma `Row()` no atributo `children:` e para que o Texto apareça corretamente, será usado o atributo `mainAxisSize:` com a propriedade `MainAxisSize.min` para que o botão de ação actions ocupe o menor espaço possível.

```
main.dart
 
...
    navigationBar: CupertinoNavigationBar(
        middle: const Text('Despesas Pessoais'),
        trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: actions,
        ),
    ),
...
```

Agora iremos pegar as actions do ***AppBar()*** e colocar dentro de uma constante `final` chamada `actions` para que possa realizar algumas modificações, para que o Título e os Botões sejam renderizados corretamente tanto no iOS quanto no Android.

Da forma que está até o momento, a renderização no iOS apresentará um erro pois o ***IconButton()*** não é um Componente do Cupertino e para resolver esse problema, será criado um Método chamado `_getIconButton(`que receberá um `IconData icon,` e uma Função que não retorna nada `Function() fn)` que será a Função executada quando o botão for pressionado.

Mais uma vez utilizaremos uma Função Ternária para realizar nossa lógica:

O Método `_getIconButton()` irá verificar se a plataforma é iOS `Platform.isIOS` se for `?` retorna `return GestureDetector()` caso contrário `:` retorna `return IconButton();`

```
main.dart
 
...
  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }
...
```

Com isso, conseguimos criar dentro das actions os botões, chamando o Método ***_getIconButton()*** ao invés de ***IconButton()*** e passando por parâmetro tanto os ***ícones*** quanto a ***Função*** e através de **Platform.isIOS** verificamos a plataforma e selecionamos o ícone correto para ser mostrado.

```
main.dart
 
...
    final actions = [
      if (isLandscape)
        _getIconButton(
          _showChart ? Icons.list : Icons.bar_chart,
          () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      ),
    ];
...
```

## Conhecendo o Componente SafeArea() <a name='conhecendo-safearea-aula-156'></a>

#### [^Sumário^](#sumario)

***SafeArea()*** é um widget que insere um `child:` ***filho*** com preenchimento suficiente para evitar invasões do sistema operacional.

Por exemplo, isso irá recuar o `child:` ***filho*** o suficiente para evitar a barra de status na parte superior da tela.

Ele também irá recuar `child:` ***filho*** pela quantidade necessária para evitar o ***The Notch no iPhone X***, ou outros recursos físicos criativos semelhantes da tela.

O motivo de estar ocorrendo erro no ***Cupertino*** é o espaço do ***The Notch*** não estar sendo considerado na hora do cálculo, uma forma de resolver isso é usando o Componente `SafeArea()` pois, ele cria uma ***Área Segura*** para renderizar os componentes corretamente na tela desconsiderando os espaços proibidos como o ***The Notch***.

Agora para resolver esse erro, vamos envolver o ***SingleChildScrollView()*** com o Componente `SafeArea()` e iremos colocar todo o conteúdo do `SingleChildScrollView()` dentro do atributo `child:`.

```
main.dart
 
...
final bodyPage = SafeArea(
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
        if (_showChart || !isLandscape)
        Container(
            height: availableHeight * (isLandscape ? 0.7 : 0.35),
            child: Chart(_recentTransactions),
        ),
        if (!_showChart || !isLandscape)
        Container(
            height: availableHeight * (isLandscape ? 1 : 0.65),
            child: TransactionList(_transactions, _removeWhere),
        ),
    ],
    ),
));
...
```
Definindo os ícones para se ajustarem tanto no ***Cupertino*** quanto no ***Material***.

Iremos definir uma variável `final` para o ***ícone de Lista*** com nome `iconList` e outra variável `final` para o ***ícone de Gráfico*** com nome `iconChart`.

```
main.dart
 
...
    //todo: Cria variável para os ícones
    final iconList = Platform.isIOS ? CupertinoIcons.list_bullet : Icons.list;
    final iconChart =
        Platform.isIOS ? CupertinoIcons.chart_bar_alt_fill : Icons.bar_chart;
 
    final actions = [
      //? Mostra o ícone, Se estiver no Modo Paisagem "isLandscape"
      if (isLandscape)
        _getIconButton(
          //? Se _showChart for verdadeiro true
          //? Mostre ? o ícone de Lista
          //? Senão : mostre o ícone de Gráfico
          _showChart ? iconList : iconChart,
          () {
            //todo: muda os ícones,
            //todo: Se verdadeiro mostra o Gráfico _showChart
            //todo: Se falso mostra a Lista !_showChart
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      ),
    ];
...
```

## Definindo um Botão Adaptativo <a name='botao-adaptativo-aula-157'></a>

#### [^Sumário^](#sumario)

Uma das estratégias que podemos tomar na hora de definir as interfaces, é criar Componentes que se adaptam ao Sistema Operacional em que estão sendo exibidas, é criar Classes e dentro destas Classes definir a Renderização Condicional baseado na plataforma *(iOS, Android, Windows, etc.)*.

Uma vez criado a Classe que encapsula toda esta complexidade, não será preciso se preocupar de ficar fazendo teste ou renderização condicional em cada Componente separadamente, pois, essa lógica está encapsulada na Classe.

Agora sim vamos criar a ***Classe AdaptativeButton***:

Dentro da pasta ***components***, iremos criar o arquivo ***adaptative_button.dart*** e dentro deste arquivo iremos definir nossa Classe.

Agora iremos criar um `StatelessWidget` apenas digitado ***stl*** no VSCode que completará parte do código para nós escolhendo a opção `Flutter Stateless Widget`.

Depois de completar o código o cursor vai ficar piscando e iremos digitar o nome de nossa Classe que será `AdaptativeButton`.

Para que possamos usar o ***Platform***, precisamos importar a biblioteca ***dart:io*** através do comando:

```
import 'dart:io';
```

E para usar os Componentes tanto Cupertino e o Material, precisamos importar suas respectivas bibliotecas:

```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
```

Agora dentro do build, iremos fazer o teste para verificar o Sistema Operacional que o APP está rodando.

Será retornado `return` caso a plataforma seja iOS `Platform.isIOS` será renderizado `? CupertinoButton()` caso contrário `:` será renderizado um `ElevatedButton()`.

A partir deste botão, iremos receber dois parâmetros, mas, a medida que precisarmos, podemos adicionar novos parâmetros.

Iremos criar duas variáveis `final`, uma `String` e outra `Function()`:

```
adaptative_button.dart
 
...
  final String label;
  final Function() onPressed;
...
```

O ***label*** está sendo recebido como uma ***String***, mas caso fosse colocar um ***ícone*** ou uma ***imagem*** o melhor seria colocar um ***Widget*** por dar mais flexibilidade.

Agora que as variáveis já foram criadas, iremos atribuí-las ao Construtor de nossa Classe.

```
adaptative_button.dart
 
...
  AdaptativeButton({
    required this.label,
    required this.onPressed,
  }); 
...
```
O próximo passo é passar por parâmetro o label e a Função onPressed para o CupertinoButton() e para o TextButton().

```
adaptative_button.dart
 
...
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(label),
            ),
          );
...
```

Agora em ***transaction_form.dart***, iremos chamar o ***Botão Adaptativo*** que acabamos de definir.

Primeiramente precisamos importar nosso Componente:

```
import 'package:expenses/components/adaptative_button.dart';
```

Agora iremos chamar o ***Botão Adaptativo*** `AdaptativeButton()` ao invés de usar o `ElevateButton()`  tendo o `label:` como `'Nova Transação',` e o `onPressed:` como `_submitForm,`.

```
transaction_form.dart
 
...
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: [
    AdaptativeButton(
        label: 'Nova Transação',
        onPressed: _submitForm,
    ),
],
),
...
```

## Definindo um TextField Adaptativo <a name='text-field-adaptativo-aula-159'></a>

#### [^Sumário^](#sumario)

Agora vamos criar a Classe ***AdaptativeTextField***:

Dentro da pasta ***components***, iremos criar o arquivo ***adaptative_text_field.dart*** e dentro deste arquivo iremos definir nossa Classe.

Agora iremos criar um `StatelessWidget` apenas digitado ***stl*** no VSCode que completará parte do código para nós escolhendo a opção `Flutter Stateless Widget`.

Depois de completar o código o cursor vai ficar piscando e iremos digitar o nome de nossa Classe que será `AdaptativeTextField`.

Para que possamos usar o ***Platform***, precisamos importar a biblioteca ***dart:io*** através do comando:

```
import 'dart:io';
```
E para usar os Componentes tanto Cupertino e o Material, precisamos importar suas respectivas bibliotecas:

```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
```

Agora dentro do build, iremos fazer o teste para verificar o Sistema Operacional que o APP está rodando.

Será retornado `return` caso a plataforma seja iOS `Platform.isIOS` será renderizado `? CupertinoTextField()` caso contrário `:` será renderizado um `TextField()`.

A partir deste botão, iremos receber 4 parâmetros, mas, a medida que precisarmos, podemos adicionar novos parâmetros.

Iremos criar 4 variáveis `final`, uma `String`, uma `TextEditingController`, uma `TextInputType` e outra `Function(String)`:

```
adaptative_text_field.dart
 
...
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted
...
```

O ***label*** está sendo recebido como uma ***String***, mas caso fosse colocar um ***ícone*** ou uma ***imagem*** o melhor seria colocar um ***Widget*** por dar mais flexibilidade.

Agora que as variáveis já foram criadas, iremos atribuí-las ao Construtor de nossa Classe.

O ***keyboardType*** terá seu valor setado para ***TextInputType.text*** que terá o teclado de texto como teclado padrão.

```
adaptative_text_field.dart
 
...
  const AdaptativeTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
  });
...
```
O próximo passo é passar por parâmetro o `label`, o `controller`, o `keyboardType` e a Função `onSubmitted` para o CupertinoTextField() e para o TextField().

No ***CupertinoTextField()*** o `label` foi adicionado no atributo`placeholder:` e foi acrescentado um atributo `padding:` para formatar melhor o TextField no iOS.

Já no ***TextField()*** foi utilizado o atributo `decoration: InputDecoration()` onde seu atributo `labelText:` recebeu o valor da variável `label`.

```
adaptative_button.dart
 
...
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            placeholder: label,
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12,
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
...
```

Agora em ***transaction_form.dart***, iremos chamar o ***TextField Adaptativo*** que acabamos de definir.

Primeiramente precisamos importar nosso Componente:

```
import 'adaptative_text_field.dart';
```

Agora iremos chamar o ***TextField Adaptativo*** `AdaptativeTextField()` ao invés de usar o `TextField()`  tendo o `label:` como `'Título',`, `controller:` como `_titleController,` e o `onSubmitted:` como `(_) => _submitForm,`.

```
transaction_form.dart
 
...
    child: Column(
      children: [
        AdaptativeTextField(
          label: 'Título',
          controller: _titleController,
          onSubmitted: (_) => _submitForm(),
        ),
        AdaptativeTextField(
          controller: _valueController,
          keyboardType: TextInputType.number,
          onSubmitted: (_) => _submitForm(),
          label: 'Valor (R\$)',
        ),
...
```

## Definindo um DatePicker Adaptativo <a name='date-picker-adaptativo-aula-160'></a>

#### [^Sumário^](#sumario)

Agora vamos criar a Classe ***AdaptativeDatePicker***:

Dentro da pasta ***components***, iremos criar o arquivo ***adaptative_date_picker.dart*** e dentro deste arquivo iremos definir nossa Classe.

Agora iremos criar um `StatelessWidget` apenas digitado ***stl*** no VSCode que completará parte do código para nós escolhendo a opção `Flutter Stateless Widget`.

Depois de completar o código o cursor vai ficar piscando e iremos digitar o nome de nossa Classe que será `AdaptativeDatePicker`.

Para que possamos usar o ***Platform***, precisamos importar a biblioteca ***dart:io*** através do comando:

```
import 'dart:io';
```
E para usar os Componentes tanto Cupertino e o Material, precisamos importar suas respectivas bibliotecas:

```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
```

Agora iremos definir a ***Configuração Android***, dentro do `build`, iremos fazer o teste para verificar o Sistema Operacional que o APP está rodando.

Será retornado `return` caso a plataforma seja iOS `Platform.isIOS` será renderizado `? ComponenteIOS()` caso contrário `:` será renderizado um `ComponenteAndroid()`.

### Inicio da Definição do Componente Android: <a name='definindo-componente-android-aula-160'></a>

#### [^Sumário^](#sumario)

Agora iremos pegar parte do código do `transaction_form.dart` que compõe a seleção de data:

```
transaction_form.dart

...
Container(
    height: 50,
    child: Row(
      children: [
        Expanded(
          child: Text(
            _selectedDate == null
                ? 'Nenhuma Data Selecionada!'
                : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
          ),
        ),
        TextButton(
          //*todo: chama a Função do Modal da Data por referência
          onPressed: _showDatePicker,
          child: const Text(
            'Selecionar Data',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  ),
...
```
Agora nós temos dois problemas relacionados aos componentes que acabamos de recortar do ***TransactionForm()***:

Temos o erro no `_selectedDate` ***Data Selecionada*** e no `_showDatePicker` que é a ***Função que mostra o DataPicker***.

Então para resolver esse erro, iremos recortar mais um pedaço de código do ***TransactionForm()***, que será a Função mencionada anteriormente:

```
transaction_form.dart

...
  //*todo: Cria o Modal para Selecionar a Data
  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      //*todo: Função que seleciona uma Data
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
...
```
Com isso, apresentam alguns problemas, pois, o ***_showDatePicker()*** está chamando um `setState()` mas o Componente não é um ***Componente StatefulWidget***, e está esperando receber um `context`, e para resolver essa parte do context, basta passar o `BuildContext` com o `context` no ***_showDatePicker()***:

```
adaptative_date_picker.dart

...
_showDatePicker(BuildContext context) {}
...
```
E na hora de chamar essa Função, lá no `onPressed:` ao invés de chamar a Função direto, será chamado usando uma ***Arrow Function*** passando o contexto `context`:

```
adaptative_date_picker.dart

...
  TextButton(
    //*todo: chama a Função do Modal da Data por referência
    onPressed: () => _showDatePicker(context),
...
```
Agora iremos precisar importar a biblioteca de Internacionalização:

```
adaptative_date_picker.dart

...
import 'package:intl/intl.dart';
...
```
Nós também iremos precisar receber algumas informações por parâmetro:

```
adaptative_date_picker.dart

...
    final DateTime selectedDate;
    //todo: Comunicação Indireta
    //todo: Passa uma Função para o Componente para quando a Data mudar,
    //todo: ele comunicar ao Pai já que este Componente ñ tem Estado.
    final Function (DateTime) onDateChanged;
...
```
Que serão passadas pelo Construtor do Componente por parâmetro:

```
adaptative_date_picker.dart

...
  const AdaptativeDatePicker({
    //todo: Data Selecionada
    required this.selectedDate,
    //todo: Data foi Alterada
    required this.onDateChanged,
  });
...
```
Agora, ***quando entrar*** no `_showDatePicker()` e a ***Data for selecionada*** `showDatePicker()` então, ao invés de chamar o `setState()`, será chamado o `onDataChanged(` e essa Função recebe como parâmetro um DateTime `picketDate)`.

```
adaptative_date_picker.dart

...
  //todo: Cria o Modal para Selecionar a Data
  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      //todo: Função que seleciona uma Data
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }
...
```
Já que a ***Data Selecionada*** `selectedDate()` não é mais **privada** e sim `final`, não precisa mais ser precedida de um `_` underline.

```
adaptative_date_picker.dart

...
  Expanded(
    child: Text(
      selectedDate == null
          ? 'Nenhuma Data Selecionada!'
          : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
    ),
  ),
...
```
Com isso, corrigimos todos os erros relacionados ao Android.

### Definição do Componente iOS: <a name='componente-ios-aula-160'></a>

#### [^Sumário^](#sumario)

Agora, iremos definir os Componentes para o iOS:

O Componente que iremos usar é o `CupertinoDatePicker()`, irá receber por parâmetro o atributo `mode:` que receberá o valor `CupertinoDatePickerMode.date,` que pega a Data *"por padrão ele pega a hora".*

Nos próximos atributos, iremos fazer semelhante ao que foi feito no Android para selecionar a Data:

`inicialDateTime:` Data inicial `DateTime.now(),`

`minimumDate:` primeira Data `DateTime(2019),`

`maximumDate:` última Data `DateTime.now(),`

`onDateTimeChanged:` chama e Função `onDateChanged,` quando houver mudança na Data pois, assim como o ***onDateTimeChanged:*** ele também recebe uma Função que recebe um ***DateTime*** então não haverá problemas.

```
adaptative_date_picker.dart

...
  ? CupertinoDatePicker(
      mode: CupertinoDatePickerMode.date,
      initialDateTime: DateTime.now(),
      minimumDate: DateTime(2019),
      maximumDate: DateTime.now(),
      onDateTimeChanged: onDateChanged,
    )
...
```
Outra coisa que precisamos resolver, é que o ***CupertinoDatePicker()***, precisa estar dentro de uma área com um tamanho específico para funcionar, por isso, iremos envolver com um `Container` ***CTRL+PONTO*** `Wrap with Container` e adicionar um atributo de altura `height:` com o valor de `180,`.

### Código Completo <a name='codigo-completo-aula-160'></a>

#### [^Sumário^](#sumario)

```
adaptative_date_picker.dart

...
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
...
```

Para finalizar, iremos voltar ao ***Componente TransactionForm()*** lá onde iniciamos retirando nosso código, para então chamar o ***Componente Adaptativo*** que acabamos de definir `AdaptativeDatePicker()`.

Passando por parâmetro a ***Data Selecionada*** `selectedDate: _selectedDate,`.

E o `onDateChange:` que receberá uma ***Nova Data*** `(newDate) {` chamar o `setState((){`passar uma Função que irá alterar o `_selectedDate` para receber `=` a Nova Data `newDate });`

```
transaction_form.dart

...
    AdaptativeDatePicker(
      selectedDate: _selectedDate,
      onDateChanged: (newDate) {
        setState(() {
          _selectedDate = newDate;
        });
      },
    ),
...
```

## 

# SUMÁRIO<a name='sumario'></a>

* [Calculando Dinamicamente a Altura da Tela - Aula 143](#calculando-dinamicamente-altura-tela)
  * [Definindo o Cálculo da Altura Disponível - Aula 143](#definindo-calculo-altura-disponivel)
  * [Código do exercício de hoje: - Aula 143](#codigo-do-exercicio-hoje-aula-143)
  * [Usando Responsividade no Texto - Aula 144](#usando-responsividade-no-texto)
  * [Responsividade do ChartBar com LayoutBuilder - Aula 145](#responsividade-chartbar-layoutbuilder)
  * [Definindo a Orientação do APP - Aula 146](#definindo-orientacao-do-app)
  * [Alternando entre Chart() e TransactionList() - Aula 147](#usando-responsividade-no-texto)
  * [Refatorando TransactionList() Responsividade - Aula 148](#refatorando-transactionlist-responsividade)
  * [Ajustando o Gráfico no Modo Paisagem - Aula 149](#ajustando-grafico-modo-paisagem)
* [](#)
* [](#)
* [](#)
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
        height: availableHeight * 0.65,
        child: TransactionList(_transactions, _removeWhere),
        ),
...
```

## 
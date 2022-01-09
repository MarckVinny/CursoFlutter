# SUMÁRIO
* [PROJETO DESPESAS PESSOAIS](#projeto-despesas-pessoais)
* [CRIANDO VERSÃO INICIAL DO APP - AULA 89](#aula-89)
  * [Criação do Projeto no Flutter](#criacao-do-projeto-flutter)
* [COMBINANDO WIDGETS - AULA 90](#combinando-widgets)
  * [Código da Aula](#codigo-aula-90)
* [CRIANDO CLASSE DE  MODELO - AULA 93](#criando-classe-modelo)
* [MAPEAR DADOS PARA WIDGETS - AULA 94](#mapear-dados-para-widgets)
* [PERSONALIZANDO ITEM DA LISTA - AULA 95](#personalizando-item-da-lista)
  * [Item Card - Aula 95](#item-card)
  * [Código Atualizado - Aula 96](#codigo-atualizado-item-card)
  * [Aplicando Estilo ao Container - Aula 97](#aplicando-estilo-ao-container)
  * [Código Atualizado - Aula 97](#codigo-atualizado-aula-97)
  * [Aplicando Estilo ao Texto - Aula 98](#aplicando-estilo-ao-texto)
  * [Desafio: Estilo no Título e na Data - Aula 98](#desafio-estilo-no-titulo-e-na-data)
  * [Diferenças entre Container e Column/Row - Aula 99](#container-vs-column)
  * [Interpolação de Strings - Aula 100](#interpolacao-de-strings)
  * [ Instalando o Pacote Externo INTL - Aula 102](#instalando-pacote-externo-intl)
* [CRIANDO A TELA DE FORMULÁRIO - Aula 103](#criando-a-tela-de-formulario)
* [](#)

# MÓDULO 4

## PROJETO DESPESAS PESSOAIS <a name="projeto-despesas-pessoais"></a>

***Visão da Aplicação:*** O aplicativo servirá para cadastrar despesas pessoais diversas. 

***Exemplo:*** contas diversas, compras, lazer, etc. 

***O aplicativo terá o seguinte comportamento:***

* Terá um ***Card*** com os últimos 7 dias mostrando as despesas de cada dia e uma barra de percentagem do valor do dia em relação com os últimos 7 dias;

* Terá dois pontos de adição de despesas;

    * Um na ***AppBar*** e outro na base da tela centralizado;

* Clicando em um dos pontos de adição, abrirá um ***Modal*** para inserir as seguintes informações:

    * Título da Despesa;

    * Valor da Despesa;

    * Data da Despesa *(através de um botão que abrirá um calendário para selecionar a data)*;

* Abaixo do Card da Semana, fica a Lista de Despesas.

### CRIANDO VERSÃO INICIAL DO APP - AULA 89 <a name="aula-89"></a>

## Criação do Projeto no Flutter <a name="criacao-do-projeto-flutter">
No terminal digitar o comando a seguir para criar o projeto: flutter create expenses

> ***Dica:*** outra opção é adicionar a organização: ***flutter create --org br.com.nomeDaEmpresa expenses***
>
>Dessa forma o pacote do ***APP*** é criado corretamente: ***br.com.nomeDaEmpresa.expenses***

Dentro de ***lib***, abrir o arquivo ***main.dart*** limpar seu conteúdo e adicionar os códigos a seguir:

Para se criar uma ***Classe StatelessWidget*** usa se o atalho ***stl***, que será preenchido o esqueleto da ***Classe***. O cursor estará piscando e é só digitar o nome da Classe que no caso é ***ExpensesApp*** (que significa despesas) que será nosso ***Widget Principal***.

Com o cursor encima de ***StatelessWidget***, digite ***CTRL + PONTO*** e clique em `import MaterialApp`.

Substitua o `Container()` por `MaterialApp()`;

E dentro de `MaterialApp()` adicione a propriedade `home:`

```
main.dart
...
// ignore: use_key_in_widget_constructors
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
...
```
Dentro de ***lib***, abrir o arquivo ***main.dart*** limpar seu conteúdo e adicionar os códigos a seguir:

Para se criar uma ***Classe StatelessWidget*** usa se o atalho ***stl***, que será preenchido o esqueleto da Classe. O cursor estará piscando e é só digitar o nome da Classe que no caso é ***ExpensesApp*** (que significa despesas) que será nosso ***Widget Principal***.

Com o cursor encima de ***StatelessWidget***, digite ***CTRL+PONTO*** e clique em `import MaterialApp`.

Substitua o `Container()` por `MaterialApp()`;

E dentro de ***MaterialApp()*** adicione a propriedade `home:`

```
main.dart
...
// ignore: use_key_in_widget_constructors
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
...
```

Para o `home:` será criado um outro ***Componente StatelessWidget***:

```
main.dart
...
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: const Text('Versão Inicial'),
    );
  }
}
```
O ***MyHomePage*** será passado como ***Componente do home***: Ex.: `home: MyHomePage(),`.

E para a aplicação começar a rodar, é preciso criar a ***Função main()*** através de uma ***Arrow Function***: `main() => runApp(ExpensesApp());`

E para Debugar a Aplicação pode se usar o atalho ***CTRL+F5***.

> Durante todo esse Módulo, toda a codificação será feita em um grande arquivo ***main*** e consequentemente uma ***Grande Árvore de Componentes***, mas ao final, o código será ***refatorado***.

## COMBINANDO WIDGETS <a name="combinando-widgets"></a>

No `body:` será substituído o ***Componente Center()*** pelo ***Componente Column()***, o *Column()* diferente do *Center()* recebe um ***Conjunto de Elementos*** `children: <Widget>` que é uma ***Lista***.

Dentro desta Lista serão colocados dois ***Card()***, será definido um `child: Text('Gráfico')`,  que será um ***Gráfico*** representando os gastos da semana e que será substituído mais a frente por um Componente.

Usando a propriedade `elevation: 5`, colocará uma sombra por trás do ***Componente Card()*** dando ao mesmo um ***efeito de volume***.

Usando a propriedade `color: Colors.blue,` adicionará a cor azul ao *background* do *Card()*.

Usando a propriedade `width: double.infinity,` fará com que o ***Card()*** ocupe toda a largura da tela.

> Para fazer com que o ***Card()*** ocupe toda a largura da tela, deverá envolver o ***Card()*** com um Container Wrap with Container.
> 
> Na Coluna `Column()` com a propriedade ***crossAxisAlignment*** é possível alinhar o ***Componente Column()*** que por padrão é alinhado ao centro `Column(crossAxisAlignment: CrossAxisAlignment.center);`

O outro Elemento também será um ***Card()*** e também será definido um `child: Text('Lista de Transações'),` e que será substituído mais a frente por um Componente.

> `mainAxisAlignment: MainAxisAlignment.spaceAround,`: Distribui os Elementos com espaços antes e depois dos mesmos na Vertical.
> crossAxisAlignment: CrossAxisAlignment.stretch,: Estica o Container na largura da tela, não sendo necessário o uso da propriedade `width: double.infinity,` no `Container()`

#### Código da Aula: <a name="codigo-aula-90"></a>

```
main.dart
...
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         // ignore: sized_box_for_whitespace
         Container(
          //width: double.infinity,
          child: const Card(
            child: Text('Gráfico'),
            color: Colors.blue,
            elevation: 5,
          ),
         ),
         const Card(
          child: Text('Lista de Transações'),
         ),
       ],
      ));
...
```

## CRIANDO CLASSE DE  MODELO <a name="criando-classe-modelo"></a>
Será criado uma ***Classe*** que irá representar os dados de uma transação, a ***Classe Transaction***.

Dento de ***lib***, será criado uma ***pasta*** chamada ***models*** e dentro será criado o arquivo ***transaction.dart*** que será nossa ***Classe***.

Dentro do arquivo será criado a ***Classe Transaction*** `class Transaction`  onde serão adicionados os ***Atributos da Classe*** e o ***Construtor da Classe*** com todos os valores ***requeridos*** *"obrigatórios"*.

```
transaction.dart
 
class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;
 
  // Construtor da Classe
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}
```

Em ***MyHomePage*** dentro de ***main.dart***, será criado uma variável *privada* do Tipo *final* contendo a *Lista de transações* `final _transactions = [];`  não esquecendo de importar a Classe Transaction `import: './models/transaction.dart';`


```
main.dart
 
...
class MyHomePage extends StatelessWidget {
  MyHomePage();
  final _transactions = [
    Transaction(
      id: 'T1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];
...
```

## MAPEAR DADOS PARA WIDGETS <a name="mapear-dados-para-widgets"></a>
### Objetivo:

Exibir as transações criadas anteriormente em ***Listas*** visíveis na ***Interface Gráfica***, isso será feito através de um ***Map*** `.map()` em cima da ***Lista*** e depois convertendo em ***Elementos Visuais*** com o `.toList()`.

O *Elemento Card* que representa a *Lista de Transações*, será substituído pelo *Elemento Column* que conterá os ***Filhos*** `children:` da *Lista* e dentro dos ***children*** será feito o mapeamento.

Em ***children***, a ***Lista*** será substituída pela ***Função Map*** `_transactions.map()`,  que receberá outra Função e essa Função, irá receber cada um dos ***Elementos*** que no caso é a transação `(tr)`  convertendo um ***Objeto do Tipo Transaction*** em um ***Componente Visual*** e no final do ***Map*** usar o `.toList()` para converter em uma *Lista*.

E no final, ter uma ***Lista*** dentro de `children:` associado a Coluna.
```
main.dart

Column(
  children: _transactions.map((tr){
    return Card(
      child: Text(tr.title),
    );
  }).toList(),
),
```
Neste exemplo será apresentado uma ***Lista*** contendo somente o ***Título*** de cada ***transação***.

## PERSONALIZANDO ITEM DA LISTA <a name="personalizando-item-da-lista"></a>
### ITEM CARD <a name="item-card"></a>

Cada ***Item da Lista*** será um ***Card*** e dentro desde *Card* estarão os ***Elementos da Transação*** e a distribuição se dará da seguinte maneira:

* O ***Elemento Card()*** conterá todos os elementos;
* O ***Elemento Row()*** conterá o Valor, o Título e a Data;
* O ***Elemento Container()*** conterá o Valor;
* O ***Elemento Column()*** conterá o Título e a Data.

### CÓDIGO ATUALIZADO <a name="codigo-atualizado-item-card"></a>
```
Column(
  children: _transactions.map((tr) {
    return Card(
      child: Row(
        children: [
          Container(
            child: Text(tr.value.toStringAsFixed(2)),
          ),
          Column(
            children: [
              Text(tr.title),
              Text(tr.date.toString()),
            ],
          )
        ],
      ),
    );
  }).toList(),
),
```

## APLICANDO ESTILO AO CONTAINER <a name="aplicando-estilo-ao-container"></a>
Para aplicar estilo aos componentes do Flutter, usa-se as propriedades e atributos dos Widgets.

Agora iremos aplicar alguns estilos ao ***Container*** que contém o ***valor***:

Para criar a ***Margem Externa:*** `margin: EdgeInserts.symmetric(horizontal: 15, vertical: 10),` com isso o Container terá uma margem.

Para criar uma ***borda ao redor do Container*** vamos usar o *Atributo* `decoration:` com a *Classe* `BoxDecoration()` e dentro usar as Propriedades `border:  Border.all()` dentro será configurado a cor `color: Colors.black,` e a largura da borda `width: 2,`

Para criar uma ***Margem Interna*** usa-se o `padding: EdgeInsets.all(10),` com isso se coloca um espaço de 10 em todos os lados.

### Código Atualizado <a name="codigo-atualizado-aula-97"></a>

```
Container(
  margin: const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  ),
  decoration: BoxDecoration(
      border: Border.all(
    color: Colors.black,
    width: 2,
  )),
  padding: const EdgeInsets.all(10),
  child: Text(tr.value.toStringAsFixed(2)),
),
```

## Aplicando Estilo ao Texto <a name="aplicando-estilo-ao-texto"></a>
Para dar estilo ao texto usa-se o `style:`  juntamente com o `TextStyle(),`  e dentro dos parênteses usa-se os parâmetros a seguir para configurar o ***Estilo do Texto***:

* No ***Peso da Fonte*** `fontWeight:` pode escolher entre diversos tipos tais como: bold (negrito), normal, etc. `fontWeight: FontWeight.bold,`.
* No ***Tamanho da Fonte*** `fontSize: 20,`
* Na ***Cor da Fonte*** `color: Colors.purple,`
```
style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.purple,
),
```

## Desafio: Estilo no Título e na Data <a name="desafio-estilo-no-titulo-e-na-data"></a>
O desafio é colocar o Título e a Data alinhada à esquerda.

Colocar o Título em negrito e com a fonte 16 e a Data colocar em cinza.

### Resposta:
1. Para alinhar à esquerda usa-se `crossAxisAlignment: CrossAxisAlignment.start,` no Elemento `Column()`.
2. Para colocar o ***Título em negrito***, antes precisa usar a *Propriedade* `style:` a *Classe* `TextStyle()` e dentro do TextStyle que se usa-se o ***Peso da Fonte*** para deixar em negrito. `fontWeight: FontWeight.bold,`.
3. Já para mudar o tamanho da fonte, usa-se `fontSize: 16,` dentro do `TextStyle()` é claro. :-P.
4. Para mudar a cor da Data para cinza, usar-se `color: Colors.black45,` dentro do `style: const TextStyle()`.

```
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(tr.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        )),
    Text(
      tr.date.toString(),
      style: const TextStyle(
        color: Colors.black45,
      ),
    ),
  ],
)
```

## DIFERENÇAS ENTRE CONTAINER E COLUMN/ROW <a name="container-vs-column"></a>
![img](container_column_row.jpg)

## Interpolação de Strings <a name="interpolacao-de-strings">

Usando a Interpolação de Strings, será associado ao Valor o símbolo da moeda R$.

Isso pode ser feito de duas maneiras:

1. Usando a ***Concatenação de Strings*** `child: Text('R\$ ' + tr.value.toStringAsFixed(2)),` sendo que, para o ***$*** aparecer corretamente é preciso usar uma barra invertida \ antes do símbolo do dollar, pois é um caractere especial dentro da ***String***.

2. Usando a ***Interpolação de String*** `child: Text('R\$ ${tr.value.toStringAsFixed(2)}'),` usando caractere especial ***$*** seguido de um ***par de chaves*** com a variável dentro.

    >***Dica:*** Se o valor da variável não tivesse ponto "**.**" como no exemplo, não seria preciso usar as chaves.

## Instalando o Pacote Externo INTL <a name='instalando-pacote-externo-intl'></a>
Para ajustar o ***valor da Data*** que está sendo exibido de forma equivocada, é preciso instalar um pacote via ***pubspec.yaml.***

Para saber que pacote usar para configurar a Data, é só pesquisar na internet, mas, o pacote que estará sendo instalado é o ***INTL*** que significa ***Internacionalização***.

O procedimento para instalar o pacote é relativamente fácil, sendo preciso ficar atendo somente à ***tabulação*** para não instalar o pacote no lugar errado, o mesmo deve ser instalado em `dependencies:` e deve ser tabulado uma vez, para ser relativo às ***dependências*** e não a outro pacote.

```
pubspec.yaml
...
dependencies:
  flutter:
    sdk: flutter
 
  intl: ^0.17.0
...
```

Agora para usar o ***INTL***, será preciso importa-lo para dentro do arquivo ***main.dart***. ***Ex.:*** `import 'package:intl/intl.dart';`.

Depois para poder formatar corretamente a ***Data***, devemos substituir o `tr.date.toString(),`  por `DateFormat('dd-MM-y').format(tr.date),`  para que possamos configurar a ***máscara da Data***, existem outros tipos de configuração olhe na documentação para mais informações.

```
main.dart
...
  Text(
     DateFormat('dd-MM-y').format(tr.date),
...
```

## Criando a Tela de Formulário <a name='criando-a-tela-de-formulario'></a>
A princípio a ***Tela de Formulário*** será criada em um ***Card***, mas posteriormente será transformada em um ***Modal***.

```
main.dart
...
Card(
    elevation: 5,
    child: Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
        children: [
        const TextField(
            decoration: InputDecoration(
            labelText: 'Título',
            ),
        ),
        const TextField(
            decoration: InputDecoration(
            labelText: 'Valor (R\$)',
            ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.purple),
                ),
                onPressed: () {},
                child: const Text('Nova Transação'),
                ),
            ),
            ],
        )
        ],
    ),
    ),
)
...
```
# SUMÁRIO<a name='sumario'></a>
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
  * [Trabalhando com Variáveis no TextField - Aula 104](#trabalhando-com-variaveis-no-textfield)
* [REFATORAÇÃO - DIVIDINDO O APP EM WIDGETS - Aula 105](#refatoracao-dividindo-o-app-em-widgets)
  * [Código TransactionList() - Aula 105](#codigo-transaction_list)
  * [Código TransactionForm() - Aula 105](#codigo-transaction_form)
  * [Código TransactionUser() - Aula 105](#codigo-transaction_user)
  * [Código Main Refatorado - Aula 105](#codigo-main-refatorado)
* [INTEGRANDO COMPONENTES DO FOMULÁRIO COM A LISTA - Aula 106](#integrando-componentes-do-formulario-com-a-lista)
  * [***Comunicação Indireta*** onSubmit _addTransaction onPressed - Aula 107](#comunicacao-indireta-onpressed-onsubmit-addtransaction)
    * [Código onSubmit - Aula 107](#codigo-onsubmit)
    * [Código _addTransaction - Aula 107](#codigo-addtransaction)
    * [Código onPressed - Aula 107](#codigo-onpressed)
  * [Habilitando Rolagem da Tela - SCROLLVIEW - Aula 108](#habilitando-rolagem-da-tela)
    * [Código Componente Principal - Aula 108](#codigo-componente-principais)
    * [Código Outros Componentes - Aula 108](#codigo-outros-componente)
  * [Usando o Componente ListView - Aula 109](#usando-o-componente-listview)
    * [Código ListView.builder - Aula 109](#codigo-listviewbuilder)
  * [Configurando Teclado Numérico - Aula 110](#configurando-teclado-numerico)
    * [Função de validação do onSubmit - Aula 110](#funcao-de-validacao-do-onsubmit)
      * [Código _submitForm() - Aula 110](#codigo-submitform)
  * [Adicionando Botão de Ícone na APP Bar - Aula 111](#adicionando-botao-de-icone-appbar)
    * [Código Botãoo Ícone App Bar - Aula 111](#codigo-botao-icone-appbar)
  * [Adicionando um Botão Flutuante - Aula 111](#adicionando-botao-flutuante)
    * [Código Botão Flutuante - Aula 111](#adicionando-botao-flutuante)
* [Refatorando e Criando o Modal - Aula 112](#refatorando-e-criando-o-modal)
  * [Usando uma Função dentro do State - Aula 114](#usando-uma-funcao-dentro-do-state)
  * [Fechando o Formulário Modal - Aula 115](#fechando-formulario-modal)
* [Criando um Tema na Aplicação - Aula 116](#criando-um-tema-na-aplicacao)
  * [Instalando e Definindo Fontes na Aplicação - Aula 118](#instalando-e-definindo-fontes-na-aplicacao) 
    * [Código Pubspec.yaml - Aula 118](#codigo-pubspec)
  * [Definir as Fontes Padrão do appBar no Tema - Aula 118](#definir-as-fontes-padrao-do-appbar-no-tema)
    * [Código Tema appBar - Aula 118](#codigo-theme-titulo-appbar)
  * [Definir as Fontes e Estilos do Título no Tema - Aula 118](#definir-fontes-estilos-titulo-theme)
    * [Código Tema Títulos - Aula 118](#codigo-theme-titulos)
    * [Código Chamada do Título - Aula 118](#codigo-chamada-titulo)
  * [Adicionando e Registrando Imagens no APP - Aula 119](#adicionando-registrando-imagens-app)
    * [Código Alterado - Aula 119](#codigo-alterado-119)
* [](#)
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
#### [^Sumário^](#sumario)
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
#### [^Sumário^](#sumario)

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
#### [^Sumário^](#sumario)

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
#### [^Sumário^](#sumario)
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
#### [^Sumário^](#sumario)
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
#### [^Sumário^](#sumario)
### ITEM CARD <a name="item-card"></a>

Cada ***Item da Lista*** será um ***Card*** e dentro desde *Card* estarão os ***Elementos da Transação*** e a distribuição se dará da seguinte maneira:

* O ***Elemento Card()*** conterá todos os elementos;
* O ***Elemento Row()*** conterá o Valor, o Título e a Data;
* O ***Elemento Container()*** conterá o Valor;
* O ***Elemento Column()*** conterá o Título e a Data.

### CÓDIGO ATUALIZADO <a name="codigo-atualizado-item-card"></a>
#### [^Sumário^](#sumario)
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
#### [^Sumário^](#sumario)
Para aplicar estilo aos componentes do Flutter, usa-se as propriedades e atributos dos Widgets.

Agora iremos aplicar alguns estilos ao ***Container*** que contém o ***valor***:

Para criar a ***Margem Externa:*** `margin: EdgeInserts.symmetric(horizontal: 15, vertical: 10),` com isso o Container terá uma margem.

Para criar uma ***borda ao redor do Container*** vamos usar o *Atributo* `decoration:` com a *Classe* `BoxDecoration()` e dentro usar as Propriedades `border:  Border.all()` dentro será configurado a cor `color: Colors.black,` e a largura da borda `width: 2,`

Para criar uma ***Margem Interna*** usa-se o `padding: EdgeInsets.all(10),` com isso se coloca um espaço de 10 em todos os lados.

### Código Atualizado <a name="codigo-atualizado-aula-97"></a>
#### [^Sumário^](#sumario)

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
#### [^Sumário^](#sumario)
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
#### [^Sumário^](#sumario)
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
#### [^Sumário^](#sumario)
![img](container_column_row.jpg)

## Interpolação de Strings <a name="interpolacao-de-strings">
#### [^Sumário^](#sumario)

Usando a Interpolação de Strings, será associado ao Valor o símbolo da moeda R$.

Isso pode ser feito de duas maneiras:

1. Usando a ***Concatenação de Strings*** `child: Text('R\$ ' + tr.value.toStringAsFixed(2)),` sendo que, para o ***$*** aparecer corretamente é preciso usar uma barra invertida \ antes do símbolo do dollar, pois é um caractere especial dentro da ***String***.

2. Usando a ***Interpolação de String*** `child: Text('R\$ ${tr.value.toStringAsFixed(2)}'),` usando caractere especial ***$*** seguido de um ***par de chaves*** com a variável dentro.

    >***Dica:*** Se o valor da variável não tivesse ponto "**.**" como no exemplo, não seria preciso usar as chaves.

## Instalando o Pacote Externo INTL <a name='instalando-pacote-externo-intl'></a>
#### [^Sumário^](#sumario)
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
#### [^Sumário^](#sumario)
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

## Trabalhando com Variáveis no TextField <a name='trabalhando-com-variaveis-no-textfield'></a>
#### [^Sumário^](#sumario)
A principio será usado variáveis em um Componente StatelessWidget o que não é recomendado (alteração de Estado), mas, mais a frente será corrigido colocando em um ***Componente StatefulWidget***.

É preciso ter cuidado, pois, mesmo criando uma variável do Tipo ***final***, `final titleController = TextEditingController();`.

Por mais que se tenha marcado essa variável como sendo ***final***, ainda assim, será preciso alterar o ***Estado Interno*** desta variável e não é bom, mesmo tendo um atributo ***final***.

Ainda assim, que dentro desta ***Classe*** `TextEditingController()` os ***Estados Internos*** estejam se alterando, ainda assim, é indicado se colocar dentro de um ***Componente StatefulWidget***.

Desta forma, está *"aderente"* ao ***Componente StatelessWidget*** porque os dois atributos foram marcados como ***final*** mas isso não é suficiente, pois, o ***Estado Interno*** estará se modificando conforme é digitado algo no ***TextField***, por enquanto irá continuar funcionando, mas, mais a frente irá quebrar mas será corrigido.

```
main.dart
...
class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
...
```
No ***TextField Título*** será adicionado o atributo `controller: titleController,` e no ***TextField Valor***, será adicionado o atributo `controller: valueController,`

```
main.dart
...
TextField(
    controller: titleController,
    decoration: const InputDecoration(
    labelText: 'Título',
    ),
),
TextField(
    controller: valueController,
    decoration: const InputDecoration(
    labelText: 'Valor (R\$)',
    ),
),
...
```

## Refatoração - Dividindo o APP em Widgets <a name='refatoracao-dividindo-o-app-em-widgets'></a>
#### [^Sumário^](#sumario)

O primeiro passo da ***Refatoração***, é criar a pasta ***Components*** dentro da pasta ***Lib***, depois disso será criado o arquivo ou componente ***transactions_list.dart*** que conterá parte do código do arquivo ***main.dart*** que será todo o conteúdo da ***lista de despesas***.

Dentro do arquivo ***transactions_list.dart*** será o ***Componente StatelessWidget*** `TransactionsList()`  e a seguir o código do arquivo.

<a name='codigo-transaction_list'></a>

#### [^Sumário^](#sumario)

```
transaction_list.dart
 
import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'components/transaction_list.dart';
import 'components/transaction_form.dart';
 
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
 
  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions);
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tr) {
        return Card(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.purple,
                  width: 2,
                )),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
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
                    DateFormat('dd-MM-y').format(tr.date),
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
```

Agora, para usar esse ***Componente*** que acabou de ser criado, dentro de ***main.dart*** deverá ser importado o arquivo ***transaction_list.dart***. `import 'components/transaction_list.dart'`;

Depois deverá chamar o ***Componente TransactionList()*** recebendo por parâmetro o ***_transaction*** `TransactionList(_transactions),`  no mesmo local de onde o código foi retirado no processo anterior de ***refatoração***.

Agora será criado o ***Componente TransactionForm()***.
Dentro da pasta ***Components***, será criado o arquivo ***transaction_form.dart*** e dentro do arquivo, será criado o ***Componente StatelessWidget*** `TransactionForm()` que conterá o conteúdo do ***Card*** que contém o ***formulário*** de Nova Transação que futuramente será transformado em um ***Modal***.

<a name='codigo-transaction_form'></a>

#### [^Sumário^](#sumario)

```
transaction_form.dart
 
import 'package:flutter/material.dart';
 
class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
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
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                    ),
                    onPressed: () {
                      print(titleController.text);
                      print('R\$ ${valueController.text}');
                    },
                    child: const Text('Nova Transação'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
```

Agora, para usar esse ***Componente*** que acabou de ser criado, dentro de ***main.dart*** deverá ser importado o arquivo ***transaction_form.dart***. `import 'components/transaction_form.dart';`

Depois deverá chamar o ***Componente StatelessWidget*** `TransactionForm(),` no mesmo local de onde o código foi retirado no processo anterior de ***refatoração***.

Seguindo o processo de ***refatoração***, será criado mais um ***Componente*** *"que mais para frente será excluído"* que é o ***Componente StatefulWidget*** `TransactionUser()` que irá controlar a ***Lista de Transações***, pois, mesmo a Lista sendo ***final***, o conteúdo da Lista pode ir evoluindo *(recebendo mais itens)*. A ***Lista é final***, porque será possível mudar a referencia para a ***variável _transaction*** mas a Lista pode ser mexida, ***cadastrando e excluindo novos elementos***.

Deverá ser importado o arquivo ***transaction_user.dart.*** `import 'components/transaction_user.dart';`, ***transaction_list.dart*** `import 'components/transaction_list.dart';`, ***transaction_form.dart*** `import 'components/transaction_form.dart';` e ***transaction.dart*** `import '../models/transaction.dart';`.

<a name='codigo-transaction_user'></a>

#### [^Sumário^](#sumario)

```
transaction_user.dart
 
import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';
import '../models/transaction.dart';
 
class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}
 
class _TransactionUserState extends State<TransactionUser> {
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
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
```

Agora, para usar esse ***Componente*** que acabou de ser criado, dentro de ***main.dart*** deverá ser importado o arquivo ***transaction_user.dart***. `import 'components/transaction_user.dart';`.

Depois deverá chamar o ***Componente StatefulWidget*** `TransactionUser()` no mesmo local de onde o código foi retirado no processo anterior de **refatoração**.

Agora, após todo esse processo de refatoração, o arquivo ***main.dart*** ficou muito mais enxuto e com isso melhor legível e ***mais fácil de dar manutenção***.

<a name='codigo-main-refatorado'></a>

#### [^Sumário^](#sumario)

```
main.dart
 
import 'package:flutter/material.dart';
import 'components/transaction_user.dart';
 
main() {
  runApp(ExpensesApp());
}
 
// ignore: use_key_in_widget_constructors
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyHomePage();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
            Container(
              // Usando "crossAxisAlignment: CrossAxisAlignment.stretch," na Column()
              // não é necessário o uso de "width: double.infinity,"
              //width: double.infinity,
              child: const Card(
                child: Text('Gráfico'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            TransactionUser(),
          ],
        ));
  }
}
```

## Integrando Componentes do Formulário com a Lista <a name='integrando-componentes-do-formulario-com-a-lista'></a>
#### [^Sumário^](#sumario)
O objetivo é inserir uma ***Nova Transação*** a partir do ***Formulário*** e fazer com que apareça na ***Lista de Transações***.

E que fará o intermédio da relação entre o ***Formulário*** e a ***Lista***, é justamente o ***Componente StatefulWidget TransactionUser()***.

Neste Componente dá para perceber claramente, o conceito de ***Comunicação Direta*** e ***Comunicação Indireta***.

***Comunicação Direta***: é quando se tem um ***Componente Pai*** passando ***Dados*** para o ***Componente Filho*** para que ele possa ser renderizado.

***Exemplo***: o Componente StatelessWidget `TransactionList(_transactions)` depende da ***Lista de Transações*** `_transactions`, se for passado uma ***Lista Vazia*** `TransactionList([])`, automaticamente o ***TransactionList()*** não mostrará mais nenhuma Transação porque foi passado uma Lista Vazia.

O Dono das informações das Transações, é o ***Componente StatefulWidget TransactionUser()***, então, claramente quem tem as informações é o `TransactionUser()` e ele está passando via ***parâmetro/construtor*** para outro ***Componente StatelessWidget Filho*** para que possa ser renderizado e isso se caracteriza uma ***Comunicação Direta***.

Dentro do ***Método Build Pai*** *"Componente StatefulWidget TransactionUser()"* há uma referencia explícita ao ***Elemento Filho*** *"TransactionList(_transactions)"*  já que se tem uma ***Árvore e Componentes***, o ***Pai*** faz uma referencia para o ***Filho***.

Agora, quando se quer que o *Filho* se comunicando com o *Pai*, ou seja, a partir do ***TransactionForm()***, precisa-se saber quando uma **Nova Transação** é cadastrada, e também precisa ser recebido de ***TransactionForm()*** o ***Título*** e o ***Valor***, ou seja, esses ***Dados*** pertencem no momento a ***TransactionForm()***, e quando o usuário clicar em **Nova Transação**, automaticamente é para se ter uma chamada ao **Componente Pai** *"Componente StatefulWidget TransactionUser()"* que precisa ser notificado quando o Usuário cadastrar uma **Nova Transação**, para assim adicionar na Lista os ***Dados*** desta nova transação e o ***Componente Filho*** *"TransactionList()"* ser Atualizado.

Agora será definido uma nova ***Função*** que se chamará: ***_addTransaction()*** e que receberá dois parâmetros: (***String title, double value***) ou seja, o valor já irá vir transformado em double embora o valor passado no Formulário seja do Tipo String. ***Ex.:*** `_addTransaction(String title, double value){};`.

Dentro das chaves, será criado uma ***Nova Transação***: `final newTransaction` que irá receber um ***Objeto do Tipo Transaction()***. ***Ex.:*** `final newTransaction = Transaction();`

E dentro dos parênteses, serão adicionados os atributos e os parâmetros para a criação desta ***Nova Transação***, e os parâmetros são:

>Lembrando que primeiro vem o atributo da ***Função*** seguido de dois pontos ex.: `title:` e logo após, o parâmetro nomeado `title`.

* id: Random().nextDouble().toString, (cria uma String randômica com valor double)
* title: title,
* value: value,
* date: DateTime.now(),

```
transaction_user.dart

...
  // Adiciona uma Nova Transação
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random()
          .nextDouble()
          .toString(), // cria um ID único randômico com valor double e transforma em String.
      title: title,
      value: value,
      date: DateTime.now(),
    );
 
      setState((){
          _transactions.add(newTransaction);
      });
  }
...
```

O próximo passo é, dentro de um ***setState(() {});*** será alterado o ***Estado da Lista*** `_transactions` ***adicionar*** `.add()` a ***Nova Transação*** criada acima `(newTransaction);`.

***Exemplo:***

```
   setState((){
     _transactions.add(newTransaction);
   });
```

Alterando o Estado, automaticamente por estar dentro de um ***Componente StatefulWidget***, quando o ***Estado muda***, a ***Árvore de Componentes*** também será atualizada.

Quando se tem um ***Componente StatelessWidget***, a única coisa que pode alterar a visualização, é passar um novo ***Dado/Parâmetro*** para o ***Construtor*** daquele ***Componente StatelessWidget***, ou seja, externamente o ***Dado mudou***, então, se passa o ***Novo Dado*** e o Componente se atualiza.

Que é o caso do ***Componente TransactionList TransactionList()***, quando essa ***Lista de Transações*** alterar, automaticamente o ***Método Build*** vai rodar e será passado uma ***Nova Lista de Transações*** `_transactions` para o `TransactionList()`, então, de forma externa o ***TransactionList()*** será atualizado porque algo externo foi alterado.

```
transaction_user.dart
 
...
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
...
```

Quando se tem um ***Componente StatefulWidget***, pode se alterar de duas formas:

* ***Externamente:*** quando houve alteração de um parâmetro recebido via ***Construtor*** de um Componente Stateful.

* ***Estado Alterado:*** quando o ***Estado do Componente*** alterou e então o Componente é ***renderizado/atualizado***, e se pode visualizar a alteração na aplicação.

## Comunicação Indireta onPressed onSubmit _addTransaction <a name='comunicacao-indireta-onpressed-onsubmit-addtransaction'></a>
#### [^Sumário^](#sumario)

Agora será estabelecida a ***Comunicação Indireta***, porque, o *TransactionForm()* precisa conversar com o ***Pai*** que é o ***TransactionUser()*** e para isso, é esperado receber como parâmetro uma ***Função*** `Function() final` que vai retornar `void` e receberá dois parâmetros `String, double` que receberá o nome de `onSubmit`, já que está dentro de um ***Formulário*** e o mesmo será submetido, ou seja, na hora de submeter será chamado essa ***Função*** passando cada um dos campos do ***Formulário***.

***Exemplo:*** `final void Function(String, double) onSubmit;`

Então, espera-se receber como parâmetro essa ***Função onSubmit*** no ***Construtor*** do **TransactionForm**.

***Exemplo:*** `TransactionForm(this.onSubmit);`

<a name='codigo-onsubmit'></a>

#### [^Sumário^](#sumario)
```
transaction_form.dart
 
...
    final void Function(String, double) onSubmit;
 
    TransactionForm(this.onSubmit);
...
```

E dentro do `TransactionUser()` existe a ***Função*** `_addTransaction()` que é exatamente a mesma ***Função*** que será recebida lá dentro de `TransactionForm()`.

Dentro do ***Método Build***, na construção do `TransactionForm()`, o ***Método Adicionar Transação*** `_addTransaction`, é possível passar essa ***Função*** como parâmetro.

***Exemplo:*** `TransactionForm(_addTransaction);`.

<a name='codigo-addtransaction'></a>

#### [^Sumário^](#sumario)
```
transaction_user.dart

...
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Comunicação Direta -> através de Dados
        TransactionList(_transactions),
        // Comunicação Indireta -> através de uma Função que espera os Dados vindos do Componete Filho
        TransactionForm(_addTransaction),
      ],
    );
  }
}
...
```
E lá dentro do ***Método TransactionForm()*** será preciso definir, o momento exato que esse Método precisa ser chamado.

A principio, isso acontecerá quando o ***Botão*** `TextButton()` for ***clicado*** `onPressed: () {},`

Primeiro será preciso armazenar em uma variável do ***Tipo final*** o texto do ***Título*** `final title = titleController.text;` e em uma variável do ***Tipo final*** o texto do ***Valor***  `final value = double.tryParse(valueController.text) ?? 0.0;` que significa que tentará converter o texto em um ***valor double*** `double.tryParse(valueController.text)` e caso não consiga `??`, colocará o ***valor padrão*** `0.0`.

O próximo passo é chamar o ***onSubmit*** que foi recebido por parâmetro, passando o ***Título*** `title` e o ***Valor*** `value`. ***Ex.:*** `onSubmit(title, value);`

Então o que aconteceu foi que, o ***Componente Pai*** passou uma ***Função*** a `onSubmit()` para o ***Componente Filho*** através do ***Construtor***.

No ***transaction_user.dart***, no ***Construtor*** do `TransactionForm()` foi passado a ***Função*** `_addTransaction` que ele espera receber como parâmetro, e dentro do ***transaction_form.dart*** dentro do ***Componente TransactionForm*** através de seu ***Construtor***, recebe a ***Função onSubmit***. ***Exemplo:*** `TransactionForm(this.onSubmit);`

E dentro ***Componente*** se sabe qual o momento exato que o usuário quer ***submeter*** o ***Formulário***, que será dentro do `TextButton()` no `onPressed:` onde os ***Dados*** do ***Título*** e ***Valor***, foram adicionados em ***variáveis*** e depois são passados por parâmetro para o `onSubmit()`.

<a name='codigo-onpressed'></a>

#### [^Sumário^](#sumario)
```
transaction_form.dart
 
...
onPressed: () {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    onSubmit(title, value);
},
...
```

A dinâmica na comunicação entre os ***Componentes***, a ***Aplicação em Flutter***, Angular, Vue, React, etc. é uma ***Grande Árvore de Componentes***, então, uma das grandes questões quanto a isso, é como esses ***Componentes*** vão se comunicar e como os ***Dados*** serão passados de um ***Componente*** para outro.

Como se consegue receber ***Dados*** de um ***Componente Filho?*** é exatamente aqui que entra as duas comunicações mais básicas entre ***Componentes***:

***Comunicação Direta ->*** que é o ***Componente Pai*** passando ***Dados*** para o ***Componente Filho***.

***Comunicação Indireta ->*** que é o ***Componente Pai*** passando uma ***Função*** para o ***Componente Filho***, que no momento certo o ***Filho*** chama essa ***Função*** passando ***Dados*** para o ***Componente Pai***.

## Habilitando Rolagem da Tela - SCROLLVIEW <a name='habilitando-rolagem-da-tela'></a>

#### [^Sumário^](#sumario)

Para habilitar a rolagem da Tela, usa-se o ***Componente SingleChildScrollView*** e para que o mesmo funcione corretamente, o ***Componente Pai*** precisa ter um tamanho definido.

E para poder habilitar esse componente, deve-se envolver o ***Componente Pai*** usando o ***CTRL+PONTO*** e selecionando a opção ***Wrap with widget*** e depois digitando `SingleChildScrollView` no lugar da opção padrão `Widget`.

Usando o ***SingleChildScrollView()*** no `body:` do APP torna todo o ***Corpo do APP rolável***.

<a name='codigo-componente-principal'></a>

#### [^Sumário^](#sumario)

```
main.dart
 
...
body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
        // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
        Container(
        // Usando "crossAxisAlignment: CrossAxisAlignment.stretch," na Column()
        // não é necessário o uso de "width: double.infinity,"
        //width: double.infinity,
        child: const Card(
            child: Text('Gráfico'),
            color: Colors.blue,
            elevation: 5,
        ),
        ),
        TransactionUser(),
    ],
    ),
));
...
```

Também é possível usar em outros componentes da Aplicação, mas é preciso envolve-lo com um `Container` e atribuir uma ***altura*** `height:` para o `Container`, para que o `SingleChildScrollView` funcione corretamente.

Mas para isso, o ***Componente Pai*** `body:` no caso, também precisa estar com a ***Rolagem da Tela habilitada***.

<a name='codigo-outros-componente'></a>

#### [^Sumário^](#sumario)

```
transaction_list.dart
 
...
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((tr) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
...
```

## Usando o Componente ListView <a name='usando-o-componente-listview'></a>

#### [^ Sumário ^](#sumario)

O ***ListView*** é um ***Componente*** específico para se criar uma Lista de Elementos, pois, neste ***Componente*** ele já engloba o SingleChildScrollView juntamente com o Column.

O diferencial e a vantagem de se usar o ***Componente ListView*** além dele ser específico para ***Lista***, é a facilidade de se configurar Listas muitos grande.

Pois, o ***ListView*** possibilita que somente parte da ***Lista*** seja renderizada, economizando assim o uso de memória do ***APP***.

E assim como no `SingleChildScrollView` o `ListView` também precisa ser ***envolvido*** por um ***Container*** `Wrap with container` e ter sua ***altura*** `height:` definida para que funcione corretamente.

A forma correta de se trabalhar com ***ListView***, é usar a ***notação ponto*** `.builder` e a partir do ***builder*** ele não irá mais esperar um `children:` mas sim dois atributos muito importantes:

* `itemCount: transactions.length,` quantidade de itens *(tamanho da quantidade de transações)*.

* `itemBuilder: (ctx, index) {...};` que recebe uma ***Função*** e o primeiro parâmetro é um ***contexto*** `ctx` que não é o ***context*** do ***BuildContext*** e o segundo é o ***índice*** `index` que é o elemento a ser renderizado na chamada da ***Função***.

* Dentro das chaves `{...}`, será colocado todo o conteúdo do `return` do `Método Widget build(BuildContext context)` e como a variável `tr` não estará mais disponível a mesma deverá ser criada  dentro desta ***Função*** `final tr = transactions[index],`  pega o índice da Lista.

* Essa ***Função*** será chamada a partir do momento que for precisando da ***informação***, ou seja, os ***elementos visíveis na Tela*** através da configuração da ***altura*** `height:` do `Container`. Todos os Elementos fora da Tela, ou seja, não visíveis não serão renderizados, economizando assim a memória do dispositivo.

<a name='codigo-listviewbuilder'></a>

#### [^ Sumário ^](#sumario)

```
transaction_list.dar
 
...
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
 
          return Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'R\$ ${tr.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
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
                      DateFormat('dd-MM-y').format(tr.date),
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
  ```

  ## Configurando Teclado Numérico <a name='configurando-teclado-numerico'></a>
  #### [^Sumário^](#sumario)

Para se configurar um teclado numérico é muito simples e existem duas opções:

* ***No Android:*** dentro de um ***Componente TextField()*** usa-se o ***atributo*** `keyboard:` com o ***Componente*** `TextInputType.number` habilitando todas as funções do teclado numérico inclusive o ***separador decimal***.

* ***Exemplo:*** `TextField(keyboard: TextInputType.number)`.

* ***No IOS:*** dentro de um ***Componente*** `TextField()` usa-se o ***atributo*** `keyboard:` com o ***Componente*** `TextInputType.numberWithOptions(decimal: true)`, precisa usar `numberWithOptions` e só aí setar para aceitar o ***separador decimal*** `(decimal: true)`

* ***Exemplo:*** `TextField(keyboard: TextInputType.numberWithOptions(decimal: true)`.

> ***Dica:*** A última opção funciona tanto no ***IOS*** quanto no ***Android***, mas se for criar um ***APP*** sem suporte a ***IOS***, use a primeira opção.

## Função de validação do onSubmit <a name='funcao-de-validacao-do-onsubmit'></a>

#### [^Sumário^](#sumario)

Criar a ***Função*** `_submitForm()`, refatorando a ***Função*** que está no `onPressed:` e a colocando dentro da nova ***Função***.

E para evitar que o `onSubmit()` seja chamado se houver algum ***Dado Inválido*** no ***Título*** ou no ***Valor***, será usando a seguinte regra: ***Se*** `if` o campo do ***Título estiver Vazio*** `title.isEmpty` ***ou*** `||` se o ***Valor*** `value` for ***menor ou igual a zero*** `<= 0`  será chamado o `return`  e ele sairá da ***Função*** sem chamar o `onSubmit`.

***Exemplo:***
```
if(title.isEmpty || value <=0) {
  return;
}
```
<a name='codigo-submitform'></a>

#### [^Sumário^](#sumario)

```
transaction_form.dart
 
...
  _submitForm() {
    final title = titleController.text;
    // double.tryParse tenta converter o valor digitado em um
    // valor double, ?? caso contrario, coloca o valor padrão 0.0
    final value =
        double.tryParse(valueController.text) ?? 0.0;
 
    if(title.isEmpty || value <=0) {
      return;
    }
 
    onSubmit(title, value);
  }
...
```

Agora será associado aos dois `TextField()` o atributo `onSubmitted:` este evento recebe uma ***Função***, que recebe uma ***String*** `onSubmitted: (_) => _submitForm()`, que fará com que chame o `onSubmit` em três pontos diferentes:

* Se estiver digitando o ***Título*** ou ***Valor*** clicar no enter para finalizar, irá fechar o teclado e tentar ***submeter*** o formulário;

* Se os ***Dados*** estiverem válidos, irá realmente ***submeter*** o formulário enviando os ***Dados*** para o Componente Pai ***transaction_user.dart***;

* Caso os ***Dados*** não forem válidos, simplesmente fecha o teclado com um `return` encerrando a ***Função***.

## Adicionando Botão de Ícone na APP Bar <a name='adicionando-botao-de-icone-appbar'></a>

#### [^Sumário^](#sumario)

Para adicionar um ***Botão na APP Bar***, utiliza-se o ***atributo*** `actions: []` que adiciona uma ***Lista de Widgets***. dentro dos colchetes adicione o ***Componente*** `IconButton()` adiciona um ***Botão de ícone***, dentro dos parênteses adicione o ***atributo*** `icon: Icon(Icons.add)` que adiciona o símbolo `+` e por fim, adiciona o ***atributo*** `onPressed: () {},` com uma ***Função Anônima Vazia***.

<a name='codigo-botao-icone-appbar'></a>

#### [^Sumário^](#sumario)

***Exemplo:***

```
main.dart
 
...
        appBar: AppBar(
          title: const Text('Despesas Pessoais'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
...
```

## Adicionando um Botão Flutuante <a name='adicionando-botao-flutuante'></a>

#### [^Sumário^](#sumario)

Para adicionar um ***Botão Flutuante***, utiliza-se o ***atributo*** `floatingActonButton:` dentro do ***Componente*** `Scaffold()` e logo após de onde termina a configuração do `body:`, adicione o ***Componente*** `FloatingActionButton()` dentro dos parênteses adicione o ***atributo*** `child: Icon(Icons.add)` que adiciona o símbolo `+` e por fim, adiciona o ***atributo*** `onPressed: () {},` com uma ***Função Anônima Vazia***.

Para poder posicionar o ***Botão Flutuante*** usa-se o ***atributo*** `floatingActionButtonLocation:` com o ***Componente*** `FloatingActionButtonLocation` com a ***notação ponto*** `.centerFloat` o botão fica centralizado, mas, usando ***CTRL + PONTO*** abrirá um menu com mais opções.

<a name='codigo-botao-flutuante'></a>

#### [^Sumário^](#sumario)

```
main.dart
 
...
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
...
```

## Refatorando e Criando o Modal <a name='refatorando-e-criando-o-modal'></a>

#### [^Sumário^](#sumario)

O arquivo ***transaction_user.dart*** será refatorado para a ***criação do Modal*** com o Formulário de adição de transação em ***main.dart***.

Então, o primeiro passo para a refatoração é:

* Transformar o ***MyHomePage*** em um ***Componente StatefulWidget***, selecionando ***StatelessWidget*** e depois digitando ***CTRL+PONTO*** e escolhendo `convert to StatefulWidget`.

* Dentro do ***Componente MyHomePage***, será criado uma ***Função*** que irá controlar o Comportamento do Modal. `_openTransactionFormModal(BuildContext context) {...} `.

Existe uma ***Função*** chamada `showModalBottonSheet()` que recebe dois parâmetros:

* `context: context,` que no caso é o `BuildContext` presente no ***MyHomePage***.

* `builder:` ele recebe uma ***Função*** que também recebe o `BuildContext`, sendo que esse `context` é um parâmetro que será passado para essa ***Função*** *"builder:"* e não é o mesmo contexto que está sendo passado para o `showModalBottonSheet(context: context)`.

* Neste `builder:` será retornado `return` um ***TransactionForm***  `TransactionForm(_addTransaction)`.

```
main.dart

...
_openTransactionFormModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      });
}
...
```

* Adicionar os imports:

```
main.dart

import 'dart:math';
import 'components/transaction_list.dart';
import 'components/transaction_form.dart';
import 'models/transaction.dart';
...
```

* Adicionar a Lista de Transações;

```
main.dart

...
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


* Adicionar a ***Função*** `_addTransaction()`

```
main.dart

...
  // Adiciona uma Nova Transação
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      // cria um ID único randômico com valor double e transforma em String.
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
 
    // Controla o Estado da Tela
    setState(() {
      _transactions.add(newTransaction);
    });
  }
...
```

* Trocar ***TransactionUser***, por ***TransactionList(_transactions)***.

* E para abrir o ***Modal***, no `onPressed:` chamar a ***Função*** `()` e ***invocar*** `=>` `_openTransactionFormModal` passando o `(context)` que está sendo recebido dentro do ***Método Build***.


* Essa Função `onPressed: () => _openTransactionFormModal(context),` será usada tanto no ***actionButton*** quanto no ***floatingActionButton***.

```
actions: [
    IconButton(
    onPressed: () => _openTransactionFormModal(context),
    icon: const Icon(Icons.add),
    )
],
```
```
floatingActionButton: FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () => _openTransactionFormModal(context),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
```
* Converter o ***TransactionForm*** em ***StatefulWidget***.

```
transaction_fom.dart

...
class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  // ignore: use_key_in_widget_constructors
  const TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();
...
```

## Usando uma Função dentro do State <a name='usando-uma-funcao-dentro-do-state'></a>

#### [^Sumário^](#sumario)

Para poder usar uma ***Função*** dentro do ***State***, existe uma ***propriedade/atributo*** que é recebido por herança chamado ***widget*** e esse atributo aponta para uma instância da ***Classe*** `TransactionForm` que ***estende*** `extends StatefulWidgets` e ele tem esse ***atributo***  `final void Function(String, double) onSubmit;` de tal forma, que se tem o acesso a esse ***atributo*** da seguinte maneira: `widget.onSubmit(title, value);` e acessa a ***Função*** que foi recebida como parâmetro.

Então a parte do ***Build*** foi transferido para o Estado State, já que o ***Build*** vai montar a ***Árvore de Componentes*** e ela é dependente do Estado, pois, quando o Estado muda o ***Build*** precisa ser rodado novamente para atualizar os componentes visuais.

Por isso, não existe problema algum em se definir diversos parâmetros para a definição do ***Componente***, mas o fato é, que se consegue acessar cada um dos parâmetros dentro do **Estado** a partir desta variável.

```
transaction_form.dart
 
...
class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
 
  // ignore: use_key_in_widget_constructors
  const TransactionForm(this.onSubmit);
 
  @override
  State<TransactionForm> createState() => _TransactionFormState();
}
 
class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
 
  final valueController = TextEditingController();

 _submitForm() {
    final title = titleController.text;
    // double.tryParse tenta converter o valor digitado em um
    // valor double, ?? caso contrario, coloca o valor padrão 0.0
    final value = double.tryParse(valueController.text) ?? 0.0;
 
    if (title.isEmpty || value <= 0) {
      return;
    }
 
    widget.onSubmit(title, value);
  }
...
```

## Fechando o Formulário Modal <a name='fechando-formulario-modal'></a>

#### [^Sumário^](#sumario)

O melhor local para se fechar o ***Modal*** no momento, é dentro da ***Função/Componente*** `_addTransaction()`  pois logo após atualizar o Estado o Modal pode e deve ser fechado.

Será usando o ***Componente*** `Navigator`, que é um ***StatefulWidget*** e possui um ***Método Estático*** chamado `.of(context)` que recebe um ***context*** como parâmetro.

Esse é um padrão muito utilizado quando se tem ***Widgets herdados*** `inheritedWidgets`, este ***Widget*** tem a capacidade de passar uma informação de um Componente do ***Inicio*** da ***Árvore de Componentes*** para um Componente que está no ***Final*** sem ter que passar por cada um dos ***Construtores*** de cada um Componentes, até chegar no Final.

O ***Método*** `.pop()`, que fará com que se selecione um ***Elemento*** em uma ***Pilha de Telas*** e a feche.

***Exemplo:*** `Navigator.of(context).pop();`

## Criando um Tema na Aplicação <a name='criando-um-tema-na-aplicacao'></a>

#### [^Sumário^](#sumario)

Para se configurar um ***Tema na Aplicação***,  entro do `MaterialApp()`, usa-se o ***atributo/propriedade*** `theme:` passando o ***Componente*** `ThemeData()` que são os ***Dados do Tema***, e dentro, podem ser colocados alguns ***atributo/propriedade***:

* `primaryColor:` recebe uma única cor Color como parâmetro;

* `primarySwatch:`  recebe um ***conjunto de cores*** `MaterialColor` como parâmetro. A diferença de se usar o ***MaterialColor*** é que ele disponibiliza uma ***Lista de Tons Cores*** *(claras e escuras)* de uma mesma ***Cor inicial***;

* `accentColor:` recebe uma ***cor*** `Color` ***Cor de Destaque*** como parâmetro, e se for usado o primarySwatch como cor primária, a Cor de Destaque também terá a sua disposição uma ***Lista de Tons de Cores***;

```
main.dart
 
...
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.purple,
      ).copyWith(
        secondary: Colors.purpleAccent[100],
      )),
    );
  }
}
...
```

> ## ***Dica:*** No DART 2.15, o `accentColor:` está depreciado e a opção que deve ser usado em seu lugar é a `secondary:`, mas para a mesma funcionar é preciso outras propriedades.
> 
> Usando o `primaryColor:`
> 
>       theme: ThemeData(
>           primaryColor: Colors.purple,
>           colorScheme: ColorScheme.fromSwatch().copyWith(
>             secondary: Colors.purpleAccent,
>           )),
> Usando o `primarySwatch:`
> 
>       theme: ThemeData(
>           colorScheme: ColorScheme.fromSwatch(
>         primarySwatch: Colors.purple).copyWith(
>         secondary: Colors.purpleAccent[100],
>       )),


Para usar a cor do ***Tema no Aplicativo***, usa-se o ***atributo/propriedade*** `color:` seguido com ***Componente*** `Theme.of(context)` usando o mesmo ***Método Estático*** usando no ***Navigator*** passando o `context` seguido da propriedade `.colorScheme.primary`, assim, se consegue pegar a ***Cor*** configurada anteriormente no `theme: ThemeData()`.  `color: Theme.of(context).colorScheme.primary,`

## Instalando e Definindo Fontes na Aplicação <a name='instalando-e-definindo-fontes-na-aplicacao'></a>

#### [^Sumário^](#sumario)

Na raiz da Aplicação deverá ser criado a ***Pasta de Recursos*** `/assets` e dentro dela a pasta de `/fonts`.

Copie as fontes escolhidas para dentro da pasta fonts, mas, espere que ainda não terminou, para que as fontes sejam reconhecidas pela ***Aplicação***, será preciso ***referenciar as fontes*** no arquivo ***pubspec.yaml*** prestando muita atenção a tabulação e aos nomes corretos respeitando maiúsculas e minúsculas.

No final do arquivo ***pubspec.yaml*** tem uma amostra, basta descomentar o código e fazer as alterações.

> ### ***Dica:*** Se o VSCode, Flutter ou o Dart não atualizar o pubspec automaticamente, rode o comando flutter pub get no terminal.

<a name='codigo-pubspec'></a>

#### [^Sumário^](#sumario)
```
pubspec.yaml
 
...
  fonts:
    - family: OpenSans
      fonts:
        - asset: assets/fonts/OpenSans-Regular.ttf
        - asset: assets/fonts/OpenSans-Bold.ttf
          weight: 700
    - family: Quicksand
      fonts:
        - asset: assets/fonts/Quicksand-Regular.ttf
        - asset: assets/fonts/Quicksand-Bold.ttf
          weight: 700
...
```

## Definir as Fontes Padrão do appBar no Tema <a name='definir-as-fontes-padrao-do-appbar-no-tema'></a>

#### [^Sumário^](#sumario)

Para se definir a Fonte Padrão no Tema do Título no appBar, usa-se:

* `appBarTheme:` é o atributo de Tema do `appBar;

* `AppBarTheme()` é o Tema onde engloba os atributos e propriedades do Componente;

* `textTheme:` é o atributo onde se faz as alterações no ***Tema do Texto do appBar***;

* `ThemeData.light()` é o ***Construtor Nomeado*** do ***Tema Claro "Padrão" do Flutter***, isso facilita porque se for preciso mexer em um ponto especifico do ***Tema associado ao Texto***, usa-se o Tema Padrão do Flutter `ThemeData.light()` pega o Texto do Tema `.textTheme` e a dele tem um Método `.copyWith()` , ou seja, irá gerar uma cópia de um atributo específico. Digitando ***CTRL+ESPAÇO*** irá aparecer todos os atributos que são possíveis de se fazer alterações;

* `title:` ou `headline6:` é o atributo que irá alterar as definições do ***Título***;

* `TextStyle()` é o ***Componente*** onde se encontram os atributos a serem definidos para o ***Título***;

* `fontFamily:` é o atributo que altera o `Tipo da Fonte`;

* `'OpenSans'` é o Nome da Fonte, que já foi adicionada e ***referenciada***;

* `fontSize:` é o atributo que define o ***Tamanho da Fonte***;

* `fontWeight:` é o ***atributo*** que define o ***Peso da Fonte***;

* `FontWeight` é o ***Componente*** que define o ***Peso da Fonte***;

* `.w700 .bold` é propriamente o ***Peso da Fonte***.

Com esses atributos, propriedades e Componentes se define o Tema do Título do appBar, a seguir segue o código:

> ### ***Dica:*** No DART 2.15, o `textTheme:` está depreciado e a opção que deve ser migrado para `toolbarTextStyle:` e o `title:` foi substituído por `headline6:`

<a name='codigo-theme-titulo-appbar'></a>

#### [^Sumário^](#sumario)
```
main.dart   // Tema do Título do appBar
 
...
        appBarTheme: AppBarTheme(
            toolbarTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                    headline6: const TextStyle(
                  fontFamily: 'OpenSans',
                ))
                .bodyText2,
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                    headline6: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
                .headline6),
...
```

## Definir as Fontes e Estilos do Título no Tema <a name='definir-fontes-estilos-titulo-theme'></a>

#### [^Sumário^](#sumario)

Agora será definido a fonte e os estilos dos ***Títulos*** fora do **appBar** no Tema.

Basicamente é a mesma definição feita no ***Título do appBar***, com a diferença que não é envolvido pelo ***Widget AppBarTheme()***.

<a name='codigo-theme-titulos'></a>

#### [^Sumário^](#sumario)

```
main.dart
 
...
textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
...
```

E para chamar o Tema no código usa-se somente uma única linha: `style: Theme.of(context).textTheme.headline6),`  no ***transaction_form.dart***.

<a name='codigo-chamada-titulo'></a>

#### [^Sumário^](#sumario)


```
transaction_form.dart
 
...
Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(tr.title,
        style: Theme.of(context).textTheme.headline6), // definido no Tema
    Text(
        DateFormat('dd-MM-y').format(tr.date),
        style: TextStyle(
        color: Colors.grey[600],
        ),
    ),
    ],
)
...
```

## Adicionando e Registrando Imagens no APP <a name='adicionando-registrando-imagens-app'></a>

#### [^Sumário^](#sumario)

Esta imagem será apresentada no lugar da Lista toda vez que não houver nenhuma transação para ser mostrada.

Primeiro devemos comentar a parte do código onde estão os ***Dados mokados da Lista*** dentro de ***main.dart*** em `_MyHomePageState`.

Após comentar o trecho de código que contem as Transactions, deve-se acrescentar a Tipagem da variável. `final List<Transaction> _transaction = [];`

Próximo passo, criar a pasta ***/images*** dentro da pasta ***/assets***, onde serão salvos os assets de imagem do projeto, assim como foi feito com as fontes anteriormente.

Passo seguinte, dentro de ***pubspec.yaml*** deve-se registrara imagem a ser usada.

Para não ocorrer erro de digitação com o caminho da imagem, clicando com o botão direito do mouse encima do arquivo desejado, clique na opção do menu: `copiar caminho relativo` e colar no local correto dentro de ***pubspec.yaml***.

```
pubspec.yaml
 
...
  assets:
    - assets/images/waiting.png
...
```
Então dentro de transaction_list.dart e dentro do build do mesmo, na child: do Container(), será criado uma Operação Ternária que fará o seguinte:

* Se `transaction.isEmpty ?` -> se ***transaction for vazio***, então mostre o conteúdo de `Column()`, onde se encontra o ***Título*** com a mensagem *Nenhuma Transação Cadastrada!* e a ***imagem*** anteriormente adicionada e registrada no projeto, dentro de ***/assets/images***.

* `:` ***caso contrario***, mostre a ***Lista*** `ListView.builder();`

<a name='codigo-alterado-119'></a>

#### [^Sumário^](#sumario)
```
transaction_list.dart
 
...
      child: transactions.isEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            )
...
```
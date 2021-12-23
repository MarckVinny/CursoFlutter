# SUMÁRIO
* [PROJETO DESPESAS PESSOAIS](#projeto-despesas-pessoais)
* [AULA 89 - Criando Versão Inicial do APP](#aula-89)
    * [Criação do Projeto no Flutter](#criacao-do-projeto-flutter)
* [AULA 90 - COMBINANDO WIDGETS](#combinando-widgets)
  * [Código da Aula](#codigo-aula-90)
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

### AULA 89 - Criando Versão Inicia do APP <a name="aula-89"></a>

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

#### Código da Aula: <a name="codigo-aula-90"></a>

```
main.dart
...
      body: Column(
       children: [
         // ignore: sized_box_for_whitespace
         Container(
          width: double.infinity,
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
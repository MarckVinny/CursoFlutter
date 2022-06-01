import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/transaction_list.dart';
import 'components/transaction_form.dart';
import 'components/chart.dart';
import 'models/transaction.dart';

main() {
  runApp(ExpensesApp());
}

// ignore:  use_key_in_widget_constructors
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //* retira o banner de debug
      debugShowCheckedModeBanner: false,

      //* Traduzindo a internacionalização INTL
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', ''),
      ],

      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(secondary: Colors.purpleAccent[100]),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
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
                        fontSize: 21,
                        fontWeight: FontWeight.bold))
                .headline6),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  //* Exibe ou ñ o Chart()
  bool _showChart = false;

  //* Filtrando as Transações Recentes
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  // Adiciona uma Nova Transação
  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      // cria um ID único randômico com valor double e transforma em String.
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    // Controla o Estado da Tela
    setState(() {
      _transactions.add(newTransaction);
    });

    // Fecha o Modal
    Navigator.of(context).pop();
  }

  //Remove um Elemento da Lista de Transações
  _removeWhere(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  //todo: Função que chama o Componente TransactionForm()
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        //todo: habilita o scroll
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  //todo: Método que cria o ícone e a Função do botão
  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    //todo: Verifica se está ou não no Modo Paisagem
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

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

    //todo: Coloca o Componente AppBar dentro da variável appBar
    final PreferredSizeWidget appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: actions,
    );

    //todo: Calcula a Altura Disponível da Tela;
    //todo: 1 - Pega a Altura Total da Tela;
    //todo: 2 - Subtrai a Altura do AppBar;
    //todo: 3 - Subtrai a Altura da Barra de Status.
    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //? Está no Modo Paisagem?
          // if (isLandscape)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Text('Exibir Gráfico'),
          //       //* Controle deslizante
          //       Switch.adaptive(
          //         activeColor: Theme.of(context).colorScheme.secondary,
          //         value: _showChart,
          //         onChanged: (value) {
          //           setState(() {
          //             _showChart = value;
          //           });
          //         },
          //       ),
          //     ],
          //   ),
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
        ],
      ),
    ));

    //todo: Se a Plataforma for IOS
    //todo: ? mostra CupertinoPageScaffold()
    //todo: senão for : mostra Scaffold()
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            //todo: Platform.isIOS identifica se o App está ou não rodando no iOS
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _openTransactionFormModal(context),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}

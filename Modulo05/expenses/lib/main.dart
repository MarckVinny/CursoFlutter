import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:math';
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
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spence_tracker/components/chart.dart';

import 'components/new_transaction.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const _HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
          primary: Colors.purple,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
        ),
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  final List<Transaction> _transactions = [];

  void _addTransaction(String title, double amount, DateTime? date) {
    if (title.isEmpty || amount.isNegative || amount.isNaN || date == null) {
      return;
    }
    setState(() {
      _transactions.add(Transaction(
        title: title,
        amount: amount,
        date: date,
        id: DateTime.now().toString(),
      ));
    });
    Navigator.of(context).pop();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddingTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addTransactionHandler: _addTransaction);
        });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: () => _startAddingTransaction(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Chart(filteredTransactions: _recentTransactions),
              TransactionList(transactions: _transactions, deleteHandler: _deleteTransaction,)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddingTransaction(context),
      ),
    );
  }
}

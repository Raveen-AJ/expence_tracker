import 'package:flutter/material.dart';

import 'components/new_transaction.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  final _transactions = [
    Transaction(
        id: "t1", title: "Buy Macbook", amount: 129.99, date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "Buy Iphone 14 pro max",
        amount: 99.99,
        date: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
      ));
    });
  }

  void _startAddingTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addTransactionHandler: _addTransaction);
        });
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
              const SizedBox(
                width: double.infinity,
                child: Card(
                  child: Text("CHART"),
                ),
              ),
              TransactionList(transactions: _transactions)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddingTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

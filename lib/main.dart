import 'package:flutter/material.dart';
import 'package:spence_tracker/components/transaction_list.dart';
import 'package:spence_tracker/models/transaction.dart';

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

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    var transactions = [
      Transaction(
          id: "t1", title: "Buy Macbook", amount: 129.99, date: DateTime.now()),
      Transaction(
          id: "t1",
          title: "Buy Iphone 14 pro max",
          amount: 99.99,
          date: DateTime.now()),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Card(
                  child: Text("CHART"),
                ),
              ),
              TransactionList(transactions: transactions)
            ],
          ),
        ));
  }
}

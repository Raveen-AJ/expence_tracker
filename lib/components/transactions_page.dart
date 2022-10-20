import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  var transactions = [
    Transaction(
        id: "t1", title: "Buy Macbook", amount: 129.99, date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "Buy Iphone 14 pro max",
        amount: 99.99,
        date: DateTime.now()),
  ];

  void addTransaction(String title, double amount) {
    setState(() {
      transactions.add(Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NewTransaction(addTransactionHandler: addTransaction),
          TransactionList(transactions: transactions)
        ],
      ),
    );
  }
}

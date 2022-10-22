import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 35,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  '\$${transaction.amount}',
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          title: Text(transaction.title),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction.date),
          ),
        ));
  }
}

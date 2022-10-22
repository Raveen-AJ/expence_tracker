import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteHandler;

  const TransactionListItem({Key? key, required this.transaction, required this.deleteHandler})
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
          trailing: IconButton(
            onPressed: () => deleteHandler(transaction.id),
            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error,),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import './transaction_list_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ...transactions.map((tx) => TransactionListItem(
                transaction: tx,
              ))
        ],
      ),
    );
  }
}

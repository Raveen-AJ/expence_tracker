import 'package:flutter/material.dart';

import './transaction_list_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteHandler;

  const TransactionList(
      {Key? key, required this.transactions, required this.deleteHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) => Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "No transactions added",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.7,
                        constraints: const BoxConstraints(
                          maxHeight: 200
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/waiting.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ))
          : SizedBox(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return TransactionListItem(
                    transaction: transactions[index],
                    deleteHandler: deleteHandler,
                  );
                },
              ),
            ),
    );
  }
}

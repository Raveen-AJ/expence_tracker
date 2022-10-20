import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransactionHandler;

  NewTransaction({Key? key, required this.addTransactionHandler})
      : super(key: key);

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(label: Text("Title")),
            controller: _titleController,
          ),
          TextField(
            decoration: const InputDecoration(label: Text("Amount")),
            controller: _amountController,
          ),
          TextButton(
            onPressed: () {
              addTransactionHandler(
                  _titleController.text, double.parse(_amountController.text));
            },
            child: const Text("Save Transaction"),
          )
        ],
      ),
    );
  }
}

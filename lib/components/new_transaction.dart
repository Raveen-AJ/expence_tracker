import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  const NewTransaction({Key? key, required this.addTransactionHandler})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
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
            keyboardType: TextInputType.number,
            onSubmitted: (_) {
              widget.addTransactionHandler(
                  _titleController.text, double.parse(_amountController.text));
            },
          ),
          TextButton(
            onPressed: () {
              widget.addTransactionHandler(
                  _titleController.text, double.parse(_amountController.text));
            },
            child: const Text("Save Transaction"),
          )
        ],
      ),
    );
  }
}

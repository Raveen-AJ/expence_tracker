import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime? _selectedDate;

  void _presetDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((date) {
      if (date != null) {
        setState(() {
          _selectedDate = date;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.only(
        left: 10,
        top: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 10
      ),
      child: SingleChildScrollView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedDate == null
                    ? "No date picked"
                    : "Picked date: ${DateFormat.yMd().format(_selectedDate!)}"),
                TextButton(
                    onPressed: _presetDatePicker,
                    child: const Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold)))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                widget.addTransactionHandler(
                    _titleController.text, double.parse(_amountController.text), _selectedDate);
              },
              child: const Text("Save Transaction"),
            )
          ],
        ),
      ),
    );
  }
}

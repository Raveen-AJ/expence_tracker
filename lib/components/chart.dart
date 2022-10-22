import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> filteredTransactions;

  const Chart({Key? key, required this.filteredTransactions}) : super(key: key);

  List<Map<String, Object>> get _barsData {
    final weekTotal = filteredTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element.amount;
    });
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var dayTotal = 0.0;
      for (Transaction tx in filteredTransactions) {
        if (tx.date.year == weekday.year &&
            tx.date.month == weekday.month &&
            tx.date.day == weekday.day) {
          dayTotal += tx.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday)[0],
        'value': dayTotal,
        'percentage': weekTotal == 0 ? 0.0 : dayTotal / weekTotal
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Container(
          height: 132,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: _barsData.map((data) {
              return Expanded(
                  child: ChartBar(barData: data));
            }).toList(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'components/transactions_page.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Text("CHART"),
                  ),
                ),
                TransactionsPage()
              ],
            ),
          ),
        ));
  }
}

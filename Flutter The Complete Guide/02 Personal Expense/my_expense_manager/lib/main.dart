import 'package:flutter/material.dart';
import 'package:my_expense_manager/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.34,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AppBar')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('Chart'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((trx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          trx.amount.toString(),
                        ),
                      ),
                      Column(
                        children: [
                          Text(trx.title),
                          Text(trx.date.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '\$${transactions[i].amount}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[i].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      DateFormat('dd-MMM-yyyy').format(transactions[i].date),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

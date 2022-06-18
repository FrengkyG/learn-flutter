import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense_manager/widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get totalSpending {
    return groupedTransactionValue.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValue.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: e['day'].toString(),
                  spendingAmount: e['amount'] as double,
                  spendingPctOfTotal: totalSpending == 0.0
                      ? 0.0
                      : ((e['amount'] as double) / totalSpending)),
            );
          }).toList(),
        ),
      ),
    );
  }
}

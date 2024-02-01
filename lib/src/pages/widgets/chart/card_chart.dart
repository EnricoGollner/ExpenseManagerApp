import 'package:expenses_manager_app/src/models/transaction_model.dart';
import 'package:expenses_manager_app/src/pages/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardChart extends StatelessWidget {
  final List<TransactionModel> recentTransactions;

  const CardChart({super.key, required this.recentTransactions});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(7),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((transaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: transaction['day'].toString(),
                value: transaction['value'],
                percentage: _getPercentage(totalDayValue: transaction['value']),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index)); // Today's date subtracting in each iteration
      double totalSum = 0.0;

      for (TransactionModel transaction in recentTransactions) {
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1), //.E() returns the day of the week in a short format - intl package
        'value': totalSum
      };
    }).toList();
  }

  double  _getPercentage({required double totalDayValue}) { 
    double weekTotal = groupedTransactions.fold(0.0, (previousValue, element) => previousValue + element['value']);

    return weekTotal == 0 ? 0 : (totalDayValue / weekTotal);
  }
}

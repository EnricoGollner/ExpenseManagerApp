import 'package:expenses_manager_app/src/core/colors.dart';
import 'package:expenses_manager_app/src/core/fonts.dart';
import 'package:expenses_manager_app/src/core/utils/formatters/formatters.dart';
import 'package:flutter/material.dart';

class CardTransaction extends StatelessWidget {
  final String title;
  final double value;
  final DateTime date;
  final Future<void> Function() addTransaction;

  const CardTransaction({super.key, required this.title, required this.value, required this.date, required this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: colorPrimary,
                width: 2,
              ),
            ),
            child: Text(Formatters.doubleToCurrency(value), style: valueTextStyle,),
          ),

          Column(children: [
            Text(title, style: transactionDateStyle),
            Text(Formatters.dateTimeToDate(date)),
          ],)
        ],
      ),
    );
  }
}
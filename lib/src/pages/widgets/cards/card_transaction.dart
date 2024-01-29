import 'package:expenses_manager_app/src/core/colors.dart';
import 'package:expenses_manager_app/src/core/fonts.dart';
import 'package:expenses_manager_app/src/core/utils/formatters/formatters.dart';
import 'package:flutter/material.dart';

class CardTransaction extends StatelessWidget {
  final String title;
  final double value;
  final DateTime date;
  final void Function() deleteTransaction;

  const CardTransaction({
    super.key,
    required this.title,
    required this.value,
    required this.date,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorPrimary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                Formatters.doubleToCurrency(value),
                style: valueTextStyle,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: labelStyle,
        ),
        subtitle: Text(
          Formatters.dateTimeToDate(date),
          style: const TextStyle(color: colorGrey),
        ),
        trailing: IconButton(
          onPressed: deleteTransaction,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}

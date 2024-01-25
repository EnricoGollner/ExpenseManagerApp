import 'package:expenses_manager_app/src/models/transaction.dart';
import 'package:expenses_manager_app/src/pages/widgets/cards/card_transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final Transaction transaction = transactions[index];

        return CardTransaction(
          title: transaction.title,
          value: transaction.value,
          date: transaction.date,
        );
      },
    );
  }
}
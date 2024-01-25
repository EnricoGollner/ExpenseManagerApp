import 'package:expenses_manager_app/src/models/transaction_model.dart';
import 'package:expenses_manager_app/src/pages/widgets/cards/card_transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;
  final Future<void> Function() addTransaction;

  const TransactionList({super.key, required this.transactions, required this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (_, index) {
        final TransactionModel transaction = transactions[index];

        return CardTransaction(
          addTransaction: addTransaction,
          title: transaction.title,
          value: transaction.value,
          date: transaction.date,
        );
      },
    );
  }
}
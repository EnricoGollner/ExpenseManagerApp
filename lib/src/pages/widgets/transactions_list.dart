import 'package:expenses_manager_app/src/models/transaction_model.dart';
import 'package:expenses_manager_app/src/pages/widgets/cards/card_transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<TransactionModel> transactions;
  final void Function({required int id}) deleteTransaction;

  const TransactionsList({super.key, required this.transactions, required this.deleteTransaction,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (_, index) {
        final TransactionModel transaction = transactions[index];
        
        return CardTransaction(
          title: transaction.title,
          value: transaction.value,
          date: transaction.date,
          deleteTransaction: () => deleteTransaction(id: transactions[index].id ?? 0),
        );
      },
    );
  }
}
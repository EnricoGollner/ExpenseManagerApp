import 'package:expenses_manager_app/src/models/transaction_model.dart';

abstract class TransactionState {
  final List<TransactionModel> transactions;
  final List<TransactionModel>? recentTransactions;

  TransactionState({required this.transactions, this.recentTransactions,});
}

class InitialTransactionState extends TransactionState {
  InitialTransactionState({required List<TransactionModel> recentTransactions}) : super(transactions: [], recentTransactions: recentTransactions);
}
class LoadingTransactionState extends TransactionState {
  LoadingTransactionState({required super.transactions});
}
class SuccessTransactionState extends TransactionState {
  SuccessTransactionState({required super.transactions, required super.recentTransactions});
}
class FailureTransactionState extends TransactionState {
  FailureTransactionState({required super.transactions});
}


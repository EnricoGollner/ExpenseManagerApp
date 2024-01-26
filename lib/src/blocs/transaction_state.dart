import 'package:expenses_manager_app/src/models/transaction_model.dart';

abstract class TransactionState {
  final List<TransactionModel> transactions;

  TransactionState({required this.transactions});
}

class InitialTransactionState extends TransactionState {
  InitialTransactionState() : super(transactions: []);
}
class LoadingTransactionState extends TransactionState {
  LoadingTransactionState({required super.transactions});
}
class SuccessTransactionState extends TransactionState {
  SuccessTransactionState({required super.transactions});
}
class FailureTransactionState extends TransactionState {
  FailureTransactionState({required super.transactions});
}


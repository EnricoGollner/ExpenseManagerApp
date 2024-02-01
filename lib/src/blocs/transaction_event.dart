import 'package:expenses_manager_app/src/models/transaction_model.dart';

abstract class TransactionEvent {}

class LoadTransactionEvent extends TransactionEvent {}

class AddTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;

  AddTransactionEvent(this.transaction);
}

class DeleteTransactionEvent extends TransactionEvent {
  final int id;

  DeleteTransactionEvent(this.id);
}

class UpdateTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;

  UpdateTransactionEvent(this.transaction);
}
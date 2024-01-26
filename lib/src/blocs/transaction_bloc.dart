import 'dart:async';

import 'package:expenses_manager_app/src/blocs/transaction_event.dart';
import 'package:expenses_manager_app/src/blocs/transaction_state.dart';
import 'package:expenses_manager_app/src/models/transaction_model.dart';
import 'package:expenses_manager_app/src/repositories/transaction_repository.dart';

class TransactionBloc {
  final _transactionRepository = TransactionRepository();

  final StreamController<TransactionEvent> _inputTransactionController = StreamController<TransactionEvent>();
  final StreamController<TransactionState> _outputTransactionController = StreamController<TransactionState>();
  
  Sink<TransactionEvent> get input => _inputTransactionController.sink;
  Stream<TransactionState> get output => _outputTransactionController.stream;

  TransactionBloc() {
    _inputTransactionController.stream.listen(_mapEventToState);
  }

  Future<void> _mapEventToState(TransactionEvent event) async {
    final List<TransactionModel> transactions = List<TransactionModel>.empty(growable: true);
    _outputTransactionController.add(LoadingTransactionState(transactions: transactions));

    if (event is LoadTransactionEvent) {
      await _transactionRepository.getTransactions().then((value) => transactions.addAll(value));
    } else if (event is AddTransactionEvent) {
      await _transactionRepository.saveTransaction(newTransaction: event.transaction).then(
            (updatedTransactions) => transactions.addAll(updatedTransactions),
          );
    }
    
    final List<TransactionModel> recentTransactions = transactions.where(
          (transaction) => transaction.date.isAfter(DateTime.now().subtract(const Duration(days: 7))),
        ).toList();

    _outputTransactionController.add(SuccessTransactionState(transactions: transactions, recentTransactions: recentTransactions));
  }
}
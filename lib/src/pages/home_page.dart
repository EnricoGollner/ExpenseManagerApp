import 'package:expenses_manager_app/src/blocs/transaction_bloc.dart';
import 'package:expenses_manager_app/src/blocs/transaction_event.dart';
import 'package:expenses_manager_app/src/blocs/transaction_state.dart';
import 'package:expenses_manager_app/src/core/utils/formatters/formatters.dart';
import 'package:expenses_manager_app/src/models/transaction_model.dart';
import 'package:expenses_manager_app/src/pages/widgets/custom_list_loader.dart';
import 'package:expenses_manager_app/src/pages/widgets/form_transaction.dart';
import 'package:expenses_manager_app/src/pages/widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TransactionBloc _transactionBloc;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void initState() {
    _transactionBloc = TransactionBloc();
    _transactionBloc.input.add(LoadTransactionEvent());
    
    super.initState();
  }

  @override
  void dispose() {
    _titleController.clear();
    _valueController.clear();
    _transactionBloc.input.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddTransactionForm(context),
          )
        ],
      ),
      body: StreamBuilder<TransactionState>(
        stream: _transactionBloc.output,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<TransactionModel> transactions = snapshot.data!.transactions;

              return Column(
                children: [
                  CustomListLoader(
                    state: snapshot.data!,
                    isEmptyList: transactions.isEmpty,
                    buildLoadingList: () {
                      return Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        child: TransactionsList(transactions: transactions),
                      );
                    },
                    buildLoadedList: () {
                      return TransactionsList(transactions: transactions);
                    },
                  )
                ],
              );
            }

            return const Center(child: Text('Erro ao carregar dados!'));
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await _showAddTransactionForm(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _showAddTransactionForm(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return FormTransaction(
          titleController: _titleController,
          valueController: _valueController,
          addTransaction: () => _addTransaction(title: _titleController.text, value: Formatters.stringToValue(text: _valueController.text)),
        );
      },
    );
  }

  void _addTransaction({required String title, required double value}) {
    final TransactionModel transaction = TransactionModel(title: title, value: value, date: DateTime.now());
    _transactionBloc.input.add(AddTransactionEvent(transaction));
  }
}

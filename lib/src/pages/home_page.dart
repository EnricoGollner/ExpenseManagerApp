import 'package:expenses_manager_app/src/core/utils/formatters/formatters.dart';
import 'package:expenses_manager_app/src/models/transaction_model.dart';
import 'package:expenses_manager_app/src/pages/widgets/cards/card_transaction_form.dart';
import 'package:expenses_manager_app/src/pages/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  final List<TransactionModel> _transactions = [
    TransactionModel(title: 'Curso Flutter', value: 22.90, date: DateTime.now()),
    TransactionModel(title: 'Curso C#', value: 22.90, date: DateTime.now())
  ];

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
      body: Column(
        children: [
          TransactionList(
            transactions: _transactions,
            addTransaction: () => _addTransaction(
              title: _titleController.text,
              value: Formatters.stringToValue(text: _valueController.text),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTransactionForm(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showAddTransactionForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return CardAddTransactionForm(
          titleController: _titleController,
          valueController: _valueController,
        );
      },
    );
  }

  Future<void> _addTransaction({required String title, required double value}) async {
    final TransactionModel transaction = TransactionModel(title: title, value: value, date: DateTime.now());
    
  }
}

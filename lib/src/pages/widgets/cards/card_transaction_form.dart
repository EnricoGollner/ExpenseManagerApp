import 'package:expenses_manager_app/src/core/utils/formatters/decimal_text_input_formatter.dart';
import 'package:expenses_manager_app/src/core/utils/validator.dart';
import 'package:expenses_manager_app/src/pages/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CardAddTransactionForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController valueController;

  ///Método construtor da classe
  const CardAddTransactionForm({super.key, required this.titleController, required this.valueController});

  @override
  State<CardAddTransactionForm> createState() => _CardAddTransactionFormState();
}

class _CardAddTransactionFormState extends State<CardAddTransactionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _valueFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          margin: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: widget.titleController,
                  focusNode: _titleFocusNode,
                  validatorFunction: Validator.isRequired,
                  label: 'Título',
                  hintText: 'Insira o título da dispesa',
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_valueFocusNode),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: widget.valueController,
                  focusNode: _valueFocusNode,
                  validatorFunction: Validator.isRequired,
                  label: 'Valor (R\$)',
                  hintText: 'Insira o valor da dispesa',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    DecimalTextInputFormatter.signalBasedOnLocale,
                    DecimalTextInputFormatter(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('Nova Transação'),
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          debugPrint('Validado');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}
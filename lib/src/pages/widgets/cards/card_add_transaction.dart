import 'package:expenses_manager_app/src/core/colors.dart';
import 'package:expenses_manager_app/src/core/utils/formatters/decimal_text_input_formatter.dart';
import 'package:expenses_manager_app/src/pages/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CardAddTransaction extends StatelessWidget {
  final TextEditingController transactionTitleController;
  final TextEditingController valueController;

  const CardAddTransaction({super.key, required this.transactionTitleController, required this.valueController});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: colorPrimary,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              CustomTextField(
                controller: transactionTitleController,
                label: 'Título',
                hintText: 'Título da transação',
              ),
              CustomTextField(
                controller: transactionTitleController,
                label: 'Valor (R\$)',
                hintText: 'Valor da transação (R\$)',
                inputFormatters: [
                  DecimalTextInputFormatter.signalBasedOnLocale,
                  DecimalTextInputFormatter(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Nova Transação'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
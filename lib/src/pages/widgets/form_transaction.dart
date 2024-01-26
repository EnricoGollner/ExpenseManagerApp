import 'package:expenses_manager_app/src/core/colors.dart';
import 'package:expenses_manager_app/src/core/fonts.dart';
import 'package:expenses_manager_app/src/core/utils/formatters/decimal_text_input_formatter.dart';
import 'package:expenses_manager_app/src/core/utils/formatters/formatters.dart';
import 'package:expenses_manager_app/src/core/utils/validator.dart';
import 'package:expenses_manager_app/src/pages/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class FormTransaction extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController valueController;
  final void Function() addTransaction;

  ///Método construtor da classe
  const FormTransaction(
      {super.key,
      required this.titleController,
      required this.valueController,
      required this.addTransaction});

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _valueFocusNode = FocusNode();

  DateTime? _selectedDate;

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
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_valueFocusNode),
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
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text( _selectedDate == null ? 'Nenhuma data selecionada!' : Formatters.dateTimeToDate(_selectedDate!), style: labelStyle,),
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: colorPrimary),
                      child: const Text(
                        'Selecionar Data',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      onPressed: () async {
                        showDatePicker(context: context, firstDate: DateTime(2000), lastDate:DateTime.now(), )
                          .then((date) => setState(() => _selectedDate = date));
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      foregroundColor: colorOnPrimary,
                    ),
                    child: const Text('Nova Transação'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.addTransaction();
                        widget.titleController.clear();
                        widget.valueController.clear();
                        Navigator.pop(context);
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

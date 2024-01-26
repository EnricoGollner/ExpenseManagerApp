import 'package:expenses_manager_app/src/core/colors.dart';
import 'package:expenses_manager_app/src/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isAutfocus;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final String? Function(String?)? validatorFunction;
  final Function(String _)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.label,
    required this.hintText,
    this.isAutfocus = false,
    this.keyboardType,
    this.prefixIcon,
    this.validatorFunction,
    this.onFieldSubmitted,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 5),
          child: Text(
            label,
            style: labelTextFieldStyle,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          style: TextStyle(color: colorOnBackground.withOpacity(0.7)),
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: colorPrimary)),
            border: const OutlineInputBorder(borderSide: BorderSide(color: colorPrimary)),
            hintText: hintText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          ),
          validator: validatorFunction,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
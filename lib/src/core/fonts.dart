import 'package:expenses_manager_app/src/core/colors.dart';
import 'package:flutter/material.dart';

TextStyle get labelStyle => const TextStyle(fontSize: 15, color: colorPrimary, fontWeight: FontWeight.bold);
TextStyle get labelTextFieldStyle => const TextStyle(fontSize: 15, color: colorSecondary, fontWeight: FontWeight.bold);
TextStyle get chartLabelStyle => const TextStyle(fontSize: 15, color: colorSecondary, fontWeight: FontWeight.bold);
TextStyle get chartValueStyle => const TextStyle(fontSize: 14, color: colorSecondary, fontWeight: FontWeight.w600);
TextStyle get transactionTitleStyle => const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
TextStyle get transactionDateStyle => const TextStyle(color: colorGrey);
TextStyle get valueTextStyle => const TextStyle(fontSize: 14, color: colorBackground, fontWeight: FontWeight.w600);
TextStyle get notFoundStyle => const TextStyle(fontSize: 17, color: colorSecondary, fontWeight: FontWeight.w600);

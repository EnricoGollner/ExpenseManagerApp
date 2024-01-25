import 'package:expenses_manager_app/src/core/colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData setMaterial3Style() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: colorPrimary,
        onPrimary: colorOnPrimary,
        secondary: colorSecondary,
        onSecondary: colorOnSecondary,
        surface: colorSurface,
        onSurface: colorOnSurface,
        background: colorBackground,
        error: colorError,
        onError: colorOnError,
        onBackground: colorOnPrimary
      ),
    );
  }
}
import 'package:expenses_manager_app/src/core/styles.dart';
import 'package:expenses_manager_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpensesManagerApp());
}

class ExpensesManagerApp extends StatelessWidget {
  const ExpensesManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp
    // ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.setMaterial3Style(),
      home: const HomePage(),
    );
  }
}

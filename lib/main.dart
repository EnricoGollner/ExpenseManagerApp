import 'package:expenses_manager_app/src/core/styles.dart';
import 'package:expenses_manager_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.setMaterial3Style(),
      home: const HomePage(),
    );
  }
}

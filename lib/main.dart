import 'package:counter_7/models/budget.dart';
import 'package:counter_7/pages/add_budget.dart';
import 'package:counter_7/appdrawer.dart';
import 'package:counter_7/pages/counter_7.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<BudgetDetails> detailBudget = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PBP TUGAS 8',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(detailBudget: detailBudget),
      
    );
  }
}





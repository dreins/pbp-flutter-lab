import 'package:counter_7/pages/add_budget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/pages/counter_7.dart';
import 'package:counter_7/pages/show_budget.dart';
import 'package:flutter/material.dart';

import 'models/budget.dart';

class AppDrawer extends StatelessWidget {
  final List<BudgetDetails> detailBudget;
  const AppDrawer({
    Key? key,
    required this.detailBudget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage(detailBudget: detailBudget)),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddBudget(detailBudget: detailBudget)),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ShowBudget(detailBudget: detailBudget)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:counter_7/appdrawer.dart';
import 'package:counter_7/models/budget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowBudget extends StatelessWidget {
  const ShowBudget({super.key, required this.detailBudget});
  final List<BudgetDetails> detailBudget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: AppDrawer(detailBudget: detailBudget),
        body: Center(
          child: detailBudget.isEmpty
              ? const Text(
                  "No Budget Uploaded !",
                  style: TextStyle(color: Colors.blue),
                )
              : ListView.builder(
                  itemCount: detailBudget.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Card(
                          child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                detailBudget[index].judul,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                DateFormat.MMMMEEEEd().format(detailBudget[index].tanggalTransaksi),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 94, 91, 91),
                                  fontStyle: FontStyle.italic
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${detailBudget[index].nominal}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                detailBudget[index].jenisBudget,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 69, 68, 68),
                                ),
                              ),
                            ],
                          ),
                        )
                      ])),
                    );
                  },
                  padding: const EdgeInsets.only(bottom: 8.0),
                ),
        ));
  }
}

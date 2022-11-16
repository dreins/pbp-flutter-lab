import 'package:counter_7/appdrawer.dart';
import 'package:counter_7/pages/counter_7.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'package:flutter/material.dart';

import '../models/budget.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({super.key, required this.detailBudget});
  final List<BudgetDetails> detailBudget;

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = "";
  int _nominal = 0;
  String? jenisBudget;
  List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: AppDrawer(detailBudget: widget.detailBudget),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Judul",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _judulBudget = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _judulBudget = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nominal",
                  // Menambahkan circular border agar lebih rapi
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                // Menambahkan behavior saat nama diketik
                onChanged: (String? value) {
                  setState(() {
                    _nominal = int.parse(value!);
                  });
                },
                // Menambahkan behavior saat data disimpan
                onSaved: (String? value) {
                  setState(() {
                    _nominal = int.parse(value!);
                  });
                },
                // Validator sebagai validasi form
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text(
                    'Pilih Jenis',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: listJenisBudget.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  value: jenisBudget,
                  onChanged: (String? newValue) {
                    setState(() {
                      jenisBudget = newValue!;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    const SizedBox(width: 3.0),
                    TextButton(
                      onPressed: (() {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2030),
                        );
                      }),
                      child: Text(DateFormat.MMMMEEEEd().format(_dateTime)),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        jenisBudget != null) {
                      BudgetDetails budget = BudgetDetails(
                        judul: _judulBudget,
                        nominal: _nominal,
                        tanggalTransaksi: _dateTime,
                        jenisBudget: jenisBudget!,
                      );
                      widget.detailBudget.add(budget);
                    }
                  },
                  child: const Text("Simpan"))
            ],
          ),
        ),
      ),
    );
  }
}

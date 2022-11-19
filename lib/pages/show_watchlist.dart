import 'package:counter_7/appdrawer.dart';
import 'package:counter_7/models/budget.dart';
import 'package:counter_7/pages/watchlist_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/models/mywatchlist.dart';

import '../main.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key, required this.detailBudget})
      : super(key: key);
  final List<BudgetDetails> detailBudget;

  @override
  _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  Future<List<MyWatchlist>> fetchToDo() async {
    var url = Uri.parse('https://pbptugastiga.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<MyWatchlist> listMyWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchlist.add(MyWatchlist.fromJson(d['fields']));
      }
    }

    return listMyWatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: AppDrawer(detailBudget: widget.detailBudget),
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada My Watch List :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyWatchlistDetails(
                                    detailBudget: widget.detailBudget,
                                    myWatchlist: snapshot.data[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 0.5)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].title}",
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: snapshot.data![index].watched,
                                              onChanged: (value) {
                                                setState(() {
                                                  snapshot.data![index].watched =
                                                      value!;
                                                });
                                              }),
                                          Text(
                                          snapshot.data![index].watched
                                              ? "Watched"
                                              : "Not Yet",
                                          style: TextStyle(
                                              color: snapshot.data![index].watched ? Colors.green : Colors.red,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // const SizedBox(height: 10),
                                  //Text("${snapshot.data![index].release_date}"),
                                ],
                              ),
                            ),
                          ));
                }
              }
            }));
  }
}

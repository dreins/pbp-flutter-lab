import 'package:counter_7/appdrawer.dart';
import 'package:counter_7/models/budget.dart';
import 'package:counter_7/models/mywatchlist.dart';
import 'package:counter_7/pages/show_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWatchlistDetails extends StatefulWidget {
  const MyWatchlistDetails(
      {Key? key, required this.detailBudget, required this.myWatchlist})
      : super(key: key);
  final List<BudgetDetails> detailBudget;
  final MyWatchlist myWatchlist;

  @override
  _MyWatchlistDetailsState createState() => _MyWatchlistDetailsState();
}

class _MyWatchlistDetailsState extends State<MyWatchlistDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: AppDrawer(detailBudget: widget.detailBudget),
      body: Column(children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(widget.myWatchlist.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        )),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            const Text(
              'Release Date: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(widget.myWatchlist.releaseDate)
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            const Text(
              'Rating: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(widget.myWatchlist.rating)
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            const Text(
              'Status: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(widget.myWatchlist.watched.toString())
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: const [
              Text(
                'Review: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(15),
            child: Text(widget.myWatchlist.review)),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyWatchlistPage(
                      detailBudget: widget.detailBudget,
                    ),
                  ),
                );
              },
              child: const Text("Back")),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart';
import '../page/drawer.dart';
import '../page/watchlist_details.dart';
import '../model/mywatchlist.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({
    super.key,
    required this.budgetList,
    required this.addBudget,
  });

  final String title = 'My Watch List';
  final List<Budget> budgetList;
  final Function(Budget) addBudget;

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  Future<List<MyWatchlist>> fetchMyWatchlist() async {
    var url = Uri.parse('https://tgs-pbp.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<MyWatchlist> listMyWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchlist.add(MyWatchlist.fromJson(d));
      }
    }
    return listMyWatchlist;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),

      drawer: MyDrawer(
        budgetList: widget.budgetList,
        addBudget: widget.addBudget,
      ),

      body: FutureBuilder(
        future: fetchMyWatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WatchlistDetailsPage(
                        budgetList: widget.budgetList,
                        addBudget: widget.addBudget,
                        movieTitle: snapshot.data![index].fields.title,
                        movieDate: snapshot.data![index].fields.releaseDate,
                        movieRating: snapshot.data![index].fields.rating,
                        movieStatus: snapshot.data![index].fields.watched,
                        movieReview: snapshot.data![index].fields.review,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                    )],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${snapshot.data![index].fields.title}')
                    ],
                  ),
                ),
              ),
            );
          }
        }
      )
    );
  }
}
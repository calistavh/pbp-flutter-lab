import 'package:flutter/material.dart';
import 'drawer.dart';
import 'mywatchlist_page.dart';
import '../main.dart';

class WatchlistDetailsPage extends StatelessWidget {
  const WatchlistDetailsPage({
    super.key,
    required this.budgetList,
    required this.addBudget,
    required this.movieTitle,
    required this.movieDate,
    required this.movieRating,
    required this.movieStatus,
    required this.movieReview,
  });

  final String title = 'Detail';
  final List<Budget> budgetList;
  final Function(Budget) addBudget;
  final String movieTitle;
  final String movieDate;
  final String movieRating;
  final String movieStatus;
  final String movieReview;

  String convertStatus(String status) {
    if (status == 'Yes') return 'Watched';
    return 'Haven\'t watched';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(title),
      ),

      drawer: MyDrawer(
        budgetList: budgetList,
        addBudget: addBudget,
      ),

      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                movieTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(2.5),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Release Date: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: movieDate),
                  ],
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(2.5),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Rating: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: movieRating),
                    const TextSpan(text: '/5'),
                  ],
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(2.5),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Status: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: convertStatus(movieStatus)),
                  ],
                )
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(2.5),
              child: Text(
                  'Review:',
                  style: TextStyle(fontWeight: FontWeight.bold),
              )
            ),

            Padding(
              padding: const EdgeInsets.all(2.5),
              child: Text(movieReview),
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyWatchlistPage(
                  budgetList: budgetList,
                  addBudget: addBudget,
                ),
              ),
            );
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
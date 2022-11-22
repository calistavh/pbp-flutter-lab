import 'package:flutter/material.dart';
import '../main.dart';
import 'form.dart';
import 'data.dart';
import 'mywatchlist_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.budgetList,
    required this.addBudget
  });

  final List<Budget> budgetList;
  final Function(Budget) addBudget;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    budgetList: budgetList,
                    addBudget: addBudget,
                  ),
                ),
              );
            },
          ),

          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFormPage(
                    budgetList: budgetList,
                    addBudget: addBudget,
                  ),
                ),
              );
            },
          ),

          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyDataPage(
                    budgetList: budgetList,
                    addBudget: addBudget,
                  ),
                ),
              );
            },
          ),

          ListTile(
            title: const Text('My Watch List'),
            onTap: () {
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
          ),

        ],
      ),
    );
  }
}
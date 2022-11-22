import 'package:flutter/material.dart';
import 'drawer.dart';
import '../main.dart';

class MyDataPage extends StatelessWidget {
  const MyDataPage({
    super.key,
    required this.budgetList,
    required this.addBudget,
  });

  final String title = 'Data Budget';
  final List<Budget> budgetList;
  final Function(Budget) addBudget;

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
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: budgetList.length,
          itemBuilder: ((context, index) {
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                        budgetList[index].title,
                        style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: Text(budgetList[index].amount.toString()),
                    trailing: Text(budgetList[index].type),
                  ),
                ],
              )
            );
          }),
        ),
      ),
    );
  }
}
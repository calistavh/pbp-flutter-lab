import 'package:flutter/material.dart';
import 'drawer.dart';

void main() {
  runApp(const MyApp());
}

class Budget {
  const Budget(this.title, this.amount, this.type);

  final String title;
  final int amount;
  final String type;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Budget> budgetList = [];

  void addBudget(Budget budget) {
    setState(() {
      budgetList.add(budget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas PBP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        budgetList: budgetList,
        addBudget: addBudget,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.budgetList,
    required this.addBudget
  });

  final String title = 'Program Counter';
  final List<Budget> budgetList;
  final Function(Budget) addBudget;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _counterIsZero = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _checkCounter();
    });
  }

  void _decrementCounter() {
    setState(() {
    _counter--;
    _checkCounter();
    });
  }

  void _checkCounter() {
    setState(() {
      _counterIsZero = _counter == 0 ? true : false;
    });
  }

  Text _showOddOrEvenText() {
    if (_counter % 2 == 0) {
      return const Text(
        'GENAP',
        style: TextStyle(color: Colors.red),
      );
    } else {
      return const Text(
        'GANJIL',
        style: TextStyle(color: Colors.blue),
      );
    }
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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _showOddOrEvenText(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Visibility(
              visible: !_counterIsZero,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

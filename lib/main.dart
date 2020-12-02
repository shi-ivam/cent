import 'package:flutter/material.dart';
import './widgets/user-transaction.dart';
import './widgets/add-transaction.dart';
import './models/transaction.dart';
import './widgets/chart-bar.dart';

void main() {
  runApp(Wrapper());
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData(
        fontFamily: "Inter",
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final nameController = TextEditingController();
  final valueController = TextEditingController();

  final List<Transaction> transactions = [
    Transaction(id: 1, amount: 129.53, date: DateTime.now(), name: "Fuel"),
    Transaction(id: 1, amount: 19.99, date: DateTime.now(), name: "Biscuits"),
    Transaction(id: 1, amount: 100.99, date: DateTime.now(), name: "Games"),
    Transaction(id: 1, amount: 1300.00, date: DateTime.now(), name: "Rent"),
  ];

  void addTransaction() {
    setState(() {
      transactions.add(Transaction(
          id: 11,
          amount: double.parse(valueController.text.toString()),
          date: DateTime.now(),
          name: nameController.text.toString()));
    });

    this.nameController.clear();
    this.valueController.clear();
    Navigator.pop(context);
  }

  void handleShow(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Add(nameController, valueController, addTransaction),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cent'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              this.handleShow(context);
            },
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.blue[50],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Bar(20),
                        Bar(30),
                        Bar(40),
                        Bar(50),
                        Bar(10),
                        Bar(80),
                        Bar(100),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 6, child: UserTransaction(this.transactions)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          this.handleShow(context);
        },
      ),
    );
  }
}

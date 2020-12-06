import 'package:flutter/material.dart';
import './widgets/user-transaction.dart';
import './widgets/add-transaction.dart';
import './models/transaction.dart';
import './widgets/chart-bar.dart';
import 'package:intl/intl.dart';

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

// Some Required Class
class DateTrans {
  final DateTime date;
  final double transactions;
  DateTrans(this.date, this.transactions);
}

// Actual Main Page
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final nameController = TextEditingController();
  final valueController = TextEditingController();
  var lastWeekTotal;
  var sevenDaysTrans;
  var pickedDate = new DateTime.now();

  final List<Transaction> transactions = [
    Transaction(
        id: 1,
        amount: 19.53,
        date: DateTime.now().subtract(Duration(days: 0)),
        name: "Fuel"),
    Transaction(
        id: 2,
        amount: 19.99,
        date: DateTime.now().subtract(Duration(days: 1)),
        name: "Biscuits"),
    Transaction(
        id: 3,
        amount: 11.99,
        date: DateTime.now().subtract(Duration(days: 2)),
        name: "Games"),
    Transaction(
        id: 4,
        amount: 13.50,
        date: DateTime.now().subtract(Duration(days: 3)),
        name: "Rent"),
  ];

  void getRequiredFilteredData() {
    var last7Days = [];
    for (var i = 0; i < 7; i++) {
      last7Days
          .add(DateTrans(DateTime.now().subtract(Duration(days: i)), 0.00));
    }
    for (var j = 0; j < this.transactions.length; j++) {
      var transaction = this.transactions[j];
      for (var k = 0; k < last7Days.length; k++) {
        var finalTotal = 0.00;
        if (transaction.date.day == last7Days[k].date.day &&
            transaction.date.month == last7Days[k].date.month &&
            transaction.date.year == last7Days[k].date.year) {
          finalTotal = finalTotal + transaction.amount;
          last7Days[k] = DateTrans(last7Days[k].date, finalTotal);
        }
      }
    }

    var total = 0.00;
    for (var x = 0; x < last7Days.length; x++) {
      print(total);
      total = total + last7Days[x].transactions;
    }
    setState(() {
      sevenDaysTrans = last7Days.reversed;
      lastWeekTotal = total;
    });
  }

  void addTransaction(DateTime x) {
    setState(() {
      transactions.add(Transaction(
          id: this.transactions.length + 1,
          amount: double.parse(valueController.text.toString()),
          date: x,
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
            child: Add(
              nameController,
              valueController,
              addTransaction,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getRequiredFilteredData();
    print(lastWeekTotal);
    print(MediaQuery.of(context).orientation);
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
              flex: MediaQuery.of(context).orientation == Orientation.landscape
                  ? 7
                  : 3,
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
                        for (var tran in sevenDaysTrans)
                          Bar(
                              (tran.transactions / lastWeekTotal) * 100,
                              DateFormat.E().format(tran.date),
                              tran.transactions)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 7, child: UserTransaction(this.transactions)),
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

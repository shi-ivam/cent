import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'add-transaction.dart';
import 'transactions.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Add(nameController, valueController, addTransaction),
            ),
          ),
        ),
        Container(
          height: 304,
          child: Transactions(this.transactions),
        )
      ],
    );
  }
}

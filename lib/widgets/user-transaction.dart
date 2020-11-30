import 'dart:ffi';

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
          amount: double.parse(valueController.text),
          date: DateTime.now(),
          name: nameController.text.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Add(nameController, valueController, addTransaction),
          ),
        ),
        Container(
          height: 294,
          child: SingleChildScrollView(child: Transactions(this.transactions)),
        )
      ],
    );
  }
}

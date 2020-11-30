import 'package:flutter/foundation.dart';

class Transaction {
  final double id;
  final String name;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.amount,
      @required this.date,
      @required this.name});
}

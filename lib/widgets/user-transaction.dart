import 'package:flutter/material.dart';
import 'transactions.dart';

class UserTransaction extends StatefulWidget {
  final List transactions;
  UserTransaction(this.transactions);
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Transactions(widget.transactions),
    );
  }
}
// Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           height: 400,
//           child: Transactions(widget.transactions),
//         )
//       ],
//     );

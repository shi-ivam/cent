import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Transactions extends StatelessWidget {
  final List transactions;
  final Function handleDelete;

  Transactions(this.transactions, this.handleDelete);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 5,
          child: ListTile(
            leading: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    '\$' + this.transactions[index].amount.toStringAsFixed(2),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    maxFontSize: 30,
                    minFontSize: 23,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            title: Text(
              this.transactions[index].name.toString(),
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            subtitle: Text(
              DateFormat('MMM dd, yyyy').format(this.transactions[index].date),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                this.handleDelete(this.transactions[index].id);
              },
              padding: EdgeInsets.zero,
            ),
          ),
        );
      },
      itemCount: this.transactions.length,
    );
  }
}

// Card(
//           child: Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       child: Text(
//                         '\$' +
//                             this.transactions[index].amount.toStringAsFixed(2),
//                         style: TextStyle(
//                             fontSize: 28, fontWeight: FontWeight.w300),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             this.transactions[index].name.toString(),
//                             style: TextStyle(
//                                 fontSize: 24, fontWeight: FontWeight.w300),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
//                             child: Text(
//                               DateFormat('MMM dd, yyyy')
//                                   .format(this.transactions[index].date),
//                               style: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.w300),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Container(
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.delete,
//                       color: Colors.black,
//                       size: 30,
//                     ),
//                     onPressed: null,
//                     padding: EdgeInsets.zero,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           elevation: 5,
//         );

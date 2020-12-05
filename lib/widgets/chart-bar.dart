import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double percent;
  final String day;
  final double total;
  Bar(this.percent, this.day, this.total);

  String getValue() {
    if (this.total > 1000) {
      return "\$" + (this.total / 1000).toString() + 'K';
    } else {
      return "\$" + (this.total).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                width: 25,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: new LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return FractionallySizedBox(
                          heightFactor: 1,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0,
                                (constraints.maxHeight / 100) *
                                    (100 - this.percent),
                                0,
                                0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Column(
                children: [
                  Text(
                    this.day,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(
                    getValue(),
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

// Stack(
//         alignment: AlignmentDirectional.bottomCenter,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//             ),
//           ),
//           new LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//             return FractionallySizedBox(
//               heightFactor: 1,
//               child: Container(
//                 margin: EdgeInsets.fromLTRB(0,
//                     (constraints.maxHeight / 100) * (100 - this.percent), 0, 0),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//               ),
//             );
//           }),
//         ],
//       ),

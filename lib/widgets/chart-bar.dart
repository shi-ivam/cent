import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double percent;
  Bar(this.percent);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
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
          new LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return FractionallySizedBox(
              heightFactor: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(0,
                    (constraints.maxHeight / 100) * (100 - this.percent), 0, 0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

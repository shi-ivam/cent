import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  final nameController;
  final valueController;
  final Function addFunc;
  Add(this.nameController, this.valueController, this.addFunc);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Name"),
          controller: this.nameController,
        ),
        TextField(
          decoration: InputDecoration(labelText: "Value"),
          controller: this.valueController,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Container(
            child: FlatButton(
              color: Colors.black26,
              onPressed: () {
                addFunc();
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.blue[400], fontSize: 17),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

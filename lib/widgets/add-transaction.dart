import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  final nameController;
  final valueController;
  final Function addFunc;
  Add(this.nameController, this.valueController, this.addFunc);

  void handleSubmit() {
    if (this.nameController.text.toString().isEmpty ||
        double.parse(this.valueController.text.toString()) <= 0) {
      return;
    }

    addFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Name"),
          controller: this.nameController,
          keyboardType: TextInputType.text,
          onSubmitted: (_) => handleSubmit(),
        ),
        TextField(
          decoration: InputDecoration(labelText: "Value"),
          controller: this.valueController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => handleSubmit(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Container(
            child: FlatButton(
              onPressed: () {
                handleSubmit();
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

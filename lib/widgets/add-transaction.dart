import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Add extends StatefulWidget {
  final nameController;
  final valueController;
  final Function addFunc;

  Add(this.nameController, this.valueController, this.addFunc);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  var pickedDate = DateTime.now();

  void handleSubmit() {
    if (this.widget.nameController.text.toString().isEmpty ||
        double.parse(this.widget.valueController.text.toString()) <= 0) {
      return;
    }

    widget.addFunc(this.pickedDate);
  }

  void showPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 30)),
            lastDate: DateTime.now())
        .then((value) => {
              this.setState(() {
                pickedDate = value;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Name"),
            controller: this.widget.nameController,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 20),
            onSubmitted: (_) => handleSubmit(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: TextField(
              decoration: InputDecoration(labelText: "Value"),
              controller: this.widget.valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(fontSize: 20),
              onSubmitted: (_) => handleSubmit(),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Date Picked : ' +
                      DateFormat('MMM dd, yyyy').format(this.pickedDate),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  ),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: this.showPicker,
                      color: Colors.transparent,
                      child: Text(
                        'Pick Date',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        handleSubmit();
                      },
                      color: Colors.blue,
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

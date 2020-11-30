import 'package:flutter/material.dart';
import './widgets/user-transaction.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cent'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  height: 200,
                  width: double.infinity,
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}

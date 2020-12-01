import 'package:flutter/material.dart';
import './widgets/user-transaction.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cent'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                  ),
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

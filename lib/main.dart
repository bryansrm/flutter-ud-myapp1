import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My app '),
        ),
        body: Center(
          child: Container(
            child: Text('NUNCA PARES DE APRENDER'),
          ),
        ),
      ),
    );
  }
}
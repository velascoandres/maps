import 'package:flutter/material.dart';

//       'pk.eyJ1IjoidmVsYXNjb2FuZHJzIiwiYSI6ImNrZ3BndXJzbzBtbHAyeW10ZDJod3MyYmgifQ.aCaJiR5X3F-hMbNe8cZpFw'

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapas'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

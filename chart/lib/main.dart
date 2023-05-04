import 'package:flutter/material.dart';

import 'CircleChart.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQuery(data: MediaQueryData(), child: Scaffold(
         appBar: AppBar(title: Text('My Page')),
      body: Center(
        child: CircleChart(speed: 200, density: 50),
      ),
      )),
    );
  }
}

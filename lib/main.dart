import 'package:flutter/material.dart';
import 'package:shuttle_calculator/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shuttle Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Color(0xff707070),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}

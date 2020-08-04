import 'package:flutter/material.dart';
import 'pages/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Todo App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: this.title),
    );
  }
}

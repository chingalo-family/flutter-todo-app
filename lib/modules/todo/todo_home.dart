import 'package:flutter/material.dart';

class TodoHome extends StatefulWidget {
  TodoHome({Key key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Todo Form'),
      ),
    );
  }
}

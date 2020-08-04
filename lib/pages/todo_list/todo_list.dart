import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList({
    Key key,
  }) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'List of todos',
            ),
          ],
        ),
      ),
    );
  }
}

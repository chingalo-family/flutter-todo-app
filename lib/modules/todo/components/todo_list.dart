import 'package:flutter/material.dart';
import 'package:todo_app/core/components/material_card.dart';
import 'package:todo_app/models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: MaterialCard(
        body: Container(
          width: double.infinity,
          height: 50.0,
          child: Text(todo.title),
        ),
      ),
    );
  }
}

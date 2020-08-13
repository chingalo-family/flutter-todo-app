import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoListDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context);
    Todo currentTodo = todoModel.currentTodo;

    return ListTile(
      title: Text(currentTodo.title),
      subtitle: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                currentTodo.description,
                style: TextStyle(fontSize: 11),
              ),
              Text(
                currentTodo.description,
                style: TextStyle(fontSize: 11),
              ),
            ]),
      ),
    );
  }
}

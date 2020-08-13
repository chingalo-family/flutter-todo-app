import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/todo_model.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo_list/components/todo_container.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context);

    List<Todo> todoList = todoModel.todoList;

    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoContainer(todo: todoList[index]);
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/modules/todo/components/todo_list.dart';

class TodoListContainer extends StatelessWidget {
  const TodoListContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = [
      Todo(title: "Todo 1", description: "Todo 1 description", assignedTo: ""),
      Todo(title: "Todo 2", description: "Todo 2 description", assignedTo: ""),
      Todo(title: "Todo 3", description: "Todo 3 description", assignedTo: ""),
      Todo(title: "Todo 4", description: "Todo 4 description", assignedTo: ""),
      Todo(title: "Todo 5", description: "Todo 5 description", assignedTo: ""),
    ];

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: todos
            .map(
              (Todo todo) => TodoList(
                todo: todo,
              ),
            )
            .toList(),
      ),
    );
  }
}

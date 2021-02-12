import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/modules/todo/pages/todo_view/todo_view.dart';

import 'todo_list.dart';

class TodoListContainer extends StatelessWidget {
  const TodoListContainer({
    Key key,
  }) : super(key: key);

  onSelectTodo(BuildContext context, Todo todo) {
    // @TODO add current todo into state
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TodoView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = [
      Todo(
          title: "Todo 1",
          description: "Todo 1 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 2",
          description: "Todo 2 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 3",
          description: "Todo 3 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 4",
          description: "Todo 4 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 5",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: true),
      Todo(
          title: "Todo 6",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 7",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: true),
      Todo(
          title: "Todo 8",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 9",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 10",
          description: "Todo 1 description",
          assignedTo: "",
          isCompleted: true),
      Todo(
          title: "Todo 11",
          description: "Todo 2 description",
          assignedTo: "",
          isCompleted: true),
      Todo(
          title: "Todo 12",
          description: "Todo 2 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 13",
          description: "Todo 3 description",
          assignedTo: "",
          isCompleted: true),
      Todo(
          title: "Todo 14",
          description: "Todo 4 description",
          assignedTo: "",
          isCompleted: true),
      Todo(
          title: "Todo 15",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: true),
      Todo(
          title: "Todo 16",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 17",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 18",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: false),
      Todo(
          title: "Todo 19",
          description: "Todo 5 description",
          assignedTo: "",
          isCompleted: true),
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
                onSelectTodo: () => onSelectTodo(
                  context,
                  todo,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

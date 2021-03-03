import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/modules/todo/pages/todo_view/todo_view.dart';

import 'todo_list.dart';

class TodoListContainer extends StatelessWidget {
  const TodoListContainer({
    Key key,
  }) : super(key: key);

  onSelectTodo(BuildContext context, Todo todo) {
    Provider.of<TodoState>(context, listen: false).setCurrentTodo(todo);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TodoView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoState>(
      builder: (context, todoState, child) {
        List<Todo> todos = todoState.todoList;
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
      },
    );
  }
}

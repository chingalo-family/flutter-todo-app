import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/todo_form.dart';
import 'package:todo_app/core/util_helpers.dart';
import 'package:todo_app/app-state/todo_model.dart';
import 'package:todo_app/models/todo.dart';

class TodoContainer extends StatelessWidget {
  TodoContainer({this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context);

    return Card(
        child: ListTile(
          onTap: () {
            todoModel.setCurrentTodo(todo);
            String title = 'Edit Todo Form';
            Widget content = Container(child: TodoForm());
            return UtilHelpers.showAddTodoForm(context, title, content);
          },
          title: Text(todo.title),
          subtitle: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'id : ${todo.id}',
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    'description : ${todo.description}',
                    style: TextStyle(fontSize: 11),
                  )
                ]),
          ),
        ));
  }
}

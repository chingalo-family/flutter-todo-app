import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/page_model.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoContainer extends StatelessWidget {
  TodoContainer({this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context);
    final pageModel = Provider.of<PageModel>(context);

    return Card(
        child: ListTile(
      onTap: () {
        todoModel.setCurrentTodo(todo);
        pageModel.setCurrentPageTitle(todo.title);
        pageModel.setCurrentSubPage('todoView');
      },
      title: Text(todo.title),
      subtitle: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                todo.description,
                style: TextStyle(fontSize: 11),
              ),
              Text(
                todo.description,
                style: TextStyle(fontSize: 11),
              )
            ]),
      ),
    ));
  }
}

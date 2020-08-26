import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/components/todo_form.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/models/todo.dart';

class TodoContainer extends StatelessWidget {
  TodoContainer({this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoState = Provider.of<TodoState>(context, listen: false);
    return Container(
      child: Card(
          child: Container(
        decoration: BoxDecoration(
            border: Border(
                left:
                    BorderSide(color: UtilHelpers.getRamdomCalor(), width: 5))),
        child: ListTile(
          onTap: () {
            todoState.setCurrentTodo(todo);
            String title = 'Edit Todo Form';
            Widget content = Container(child: TodoForm());
            return UtilHelpers.showPopUpModal(context, title, content);
          },
          title: Text(
            todo.title,
            style: UtilHelpers.getFontStyles(20.0, null),
          ),
          subtitle: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'id : ${todo.id}',
                    style: UtilHelpers.getFontStyles(18.0, null),
                  ),
                  Text(
                    'description : ${todo.description}',
                    style: UtilHelpers.getFontStyles(18.0, null),
                  )
                ]),
          ),
        ),
      )),
    );
  }
}

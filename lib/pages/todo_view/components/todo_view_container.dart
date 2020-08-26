import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo_view/components/todo_task_container.dart';

class TodoViewContainer extends StatelessWidget {
  const TodoViewContainer(
      {Key key, @required this.todo, @required this.onEditTodoDetails})
      : super(key: key);

  final Todo todo;
  final VoidCallback onEditTodoDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: UtilHelpers.getRamdomCalor(), width: 5))),
            child: Column(
              children: [
                ListTile(
                  onTap: this.onEditTodoDetails,
                  title: Text(
                    todo.title,
                    style: UtilHelpers.getFontStyles(20.0, null),
                  ),
                  subtitle: Text(todo.description,
                      style: UtilHelpers.getFontStyles(18.0, null)),
                ),
              ],
            ),
          ),
        ),
        Container(
            child: Text('Tasks List',
                style: UtilHelpers.getFontStyles(20.0, null))),
        Visibility(
            visible: todo.tasks.length == 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: UtilHelpers.getRamdomCalor(), width: 5))),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(
                          'You have ${todo.tasks.length} tasks click (+) to add',
                          style: UtilHelpers.getFontStyles(18.0, null)),
                    ),
                  ),
                ],
              ),
            )),
        Card(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: UtilHelpers.getRamdomCalor(), width: 5))),
            child: Column(
              children: todo.tasks
                  .map((TodoTask todoTask) =>
                      TodoTaskContainer(todoTask: todoTask))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}

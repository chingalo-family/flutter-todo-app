import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class TodoTaskForm extends StatelessWidget {
  const TodoTaskForm({Key key, @required this.todo, @required this.todoTask})
      : super(key: key);

  final Todo todo;
  final TodoTask todoTask;

  @override
  Widget build(BuildContext context) {
    TodoState todoState = Provider.of<TodoState>(context, listen: false);

    onSave() {
      todoTask.isCompleted = true;
      todoTask.title = 'Task';
      todoState.addTodoTask(todoTask);
    }

    return Column(
      children: [
        Row(
          children: [
            Text(todo.title, style: UtilHelpers.getFontStyles(18.0, null)),
            Text(todoTask.id, style: UtilHelpers.getFontStyles(15.0, null))
          ],
        ),
        RaisedButton(
          onPressed: onSave,
          child: Text('save'),
        )
      ],
    );
  }
}

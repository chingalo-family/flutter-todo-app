import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class DeleteTodoTaskConfirmation extends StatelessWidget {
  const DeleteTodoTaskConfirmation(
      {Key key, @required this.todo, @required this.todoTask})
      : super(key: key);

  final Todo todo;
  final TodoTask todoTask;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Delete task in "${todo.title}"',
            style: UtilHelpers.getFontStyles(25, null)),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Text(
              'You are about to delete " ${todoTask.title} " task in "${todo.title}",  are you sure?"',
              style: UtilHelpers.getFontStyles(14.0, null)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
                onPressed: () => cancelConfirmationDeletion(context),
                child: Text(
                  'Cancel',
                  style: UtilHelpers.getFontStyles(12, Colors.redAccent),
                )),
            FlatButton(
                onPressed: () => confirmationDeletion(context),
                child:
                    Text('Delete', style: UtilHelpers.getFontStyles(12, null)))
          ],
        )
      ],
    );
  }

  cancelConfirmationDeletion(BuildContext context) {
    Navigator.of(context).pop();
  }

  confirmationDeletion(BuildContext context) {
    TodoState todoState = Provider.of<TodoState>(context, listen: false);
    todoState.deleteTodoTask(todoTask);
    List<TodoTask> tasks = todo.tasks;
    todo.tasks =
        tasks.where((TodoTask task) => task.id != todoTask.id).toList();
    Navigator.of(context).pop();
  }
}

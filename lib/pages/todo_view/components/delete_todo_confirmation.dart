import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class DeleteTodoConfirmation extends StatelessWidget {
  const DeleteTodoConfirmation({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final Todo todo;

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
              'You are about to delete "${todo.title}" todo,  are you sure?"',
              style: UtilHelpers.getFontStyles(20, null)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
                onPressed: () => cancelConfirmationDeletion(context),
                child: Text(
                  'Cancel',
                  style: UtilHelpers.getFontStyles(18, Colors.redAccent),
                )),
            FlatButton(
                onPressed: () => confirmationDeletion(context),
                child:
                    Text('Delete', style: UtilHelpers.getFontStyles(18, null)))
          ],
        )
      ],
    );
  }

  cancelConfirmationDeletion(BuildContext context) {
    Navigator.of(context).pop();
  }

  confirmationDeletion(BuildContext context) {
    Provider.of<TodoState>(context, listen: false)
        .deleteTodo(todo)
        .then((value) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }
}

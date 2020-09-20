import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/components_old/todo_form.dart';
import 'package:todo_app/core/utils/util_helpers.dart';

class ButtonFloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showAddTodoForm(BuildContext context) {
      Provider.of<TodoState>(context, listen: false).resetCurrentTodo();
      Widget content = Container(child: TodoForm());
      return UtilHelpers.showPopUpModal(context, content);
    }

    return FloatingActionButton(
      onPressed: () {
        showAddTodoForm(context);
      },
      child: Icon(Icons.add),
    );
  }
}

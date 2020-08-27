import 'package:flutter/material.dart';
import 'package:todo_app/core/components/todo_form.dart';
import 'package:todo_app/core/utils/util_helpers.dart';

class ButtonFloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showAddTodoForm(BuildContext context) {
      Widget content = Container(child: TodoForm());
      return UtilHelpers.showPopUpModal(context, content);
    }

    return FloatingActionButton(
      onPressed: () {
        //return addTodo();
        showAddTodoForm(context);
      },
      child: Icon(Icons.add),
    );
  }
}

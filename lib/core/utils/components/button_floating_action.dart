import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/components/todo_form.dart';
import 'package:todo_app/core/utils/util_helpers.dart';

class ButtonFloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showAddTodoForm(BuildContext context) {
      String title = 'Todo Form';
      Widget content = Container(child: TodoForm());
      return UtilHelpers.showPopUpModal(context, title, content);
    }

    return Visibility(
        child: FloatingActionButton(
          onPressed: () {
            //return addTodo();
            showAddTodoForm(context);
          },
          child: Icon(Icons.add),
        ),
        visible: true);
  }
}

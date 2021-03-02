import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/todo_form_state.dart';
import 'package:todo_app/models/todo.dart';

class TodoFormStateHelper {
  // controll for form state for todo
  static updateFormState(
    BuildContext context,
    Todo todo,
    bool isEditableMode,
  ) {
    Provider.of<TodoFormState>(context, listen: false).resetFormState();
    Provider.of<TodoFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (todo != null) {
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState('id', todo.id);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState('title', todo.title);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState('description', todo.description);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("assignedTo", todo.assignedTo);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("createdBy", todo.createdBy);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("createdOn", todo.createdOn);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("dueDate", todo.dueDate);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("groupId", todo.groupId);
    }
  }
}

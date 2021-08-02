import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/todo_task_form_state.dart';
import 'package:todo_app/models/todo_task.dart';

class TodoTaskFormStateHelper {
  //
  static updateFormState(
    BuildContext context,
    TodoTask todoTask,
    bool isEditableMode,
  ) {
    Provider.of<TodoTaskFormState>(context, listen: false).resetFormState();
    Provider.of<TodoTaskFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<TodoTaskFormState>(context, listen: false)
        .setFormFieldState('id', todoTask.id);
    Provider.of<TodoTaskFormState>(context, listen: false)
        .setFormFieldState('todoId', todoTask.todoId);
    Provider.of<TodoTaskFormState>(context, listen: false)
        .setFormFieldState('title', todoTask.title);
    Provider.of<TodoTaskFormState>(context, listen: false)
        .setFormFieldState('isCompleted', todoTask.isCompleted);
    Provider.of<TodoTaskFormState>(context, listen: false)
        .setFormFieldState('createdOn', todoTask.createdOn);
    Provider.of<TodoTaskFormState>(context, listen: false)
        .setFormFieldState('createdBy', todoTask.createdBy);
    Provider.of<TodoTaskFormState>(context, listen: false)
        .setFormFieldState('assignedTo', todoTask.assignedTo);
    Provider.of<TodoTaskFormState>(context, listen: false)
        .setFormFieldState('dueDate', todoTask.dueDate);
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/components_old/boolean_input_field.dart';
import 'package:todo_app/core/components_old/todo_input_field.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_field.dart';

class TodoTaskForm extends StatelessWidget {
  const TodoTaskForm(
      {Key key,
      @required this.todo,
      @required this.todoTask,
      @required this.isNewTask})
      : super(key: key);

  final Todo todo;
  final TodoTask todoTask;
  final bool isNewTask;

  @override
  Widget build(BuildContext context) {
    TodoState todoState = Provider.of<TodoState>(context, listen: false);
    List<TodoField> labels = TodoField.getTodoTaskFormFields();

    void onCancel() {
      Navigator.of(context).pop();
    }

    bool isTodoReadyForSubmit() {
      return todoTask != null &&
          todoTask.id.isNotEmpty &&
          todoTask.title.isNotEmpty;
    }

    onSaveTodoTask() {
      bool isFormRead = isTodoReadyForSubmit();
      if (isFormRead) {
        todoState.addTodoTask(todoTask);
        if (isNewTask) {
          todo.tasks.add(todoTask);
          todoState.setCurrentTodo(todo);
        }
        Navigator.of(context).pop();
      }
    }

    void onInputValueChange(TodoField inputField, value) {
      if (inputField.id == 'title') {
        todoTask.title = value;
      } else if (inputField.id == 'isCompleted') {
        todoTask.isCompleted = value;
      }
    }

    String getInitialValue(TodoField inputField) {
      return inputField.id == 'title'
          ? todoTask.title
          : inputField.id == 'isCompleted' ? '${todoTask.isCompleted}' : '';
    }

    return Column(
      children: [
        Column(
          children: labels.map((TodoField inputField) {
            return inputField.inputType == 'BOOLEAN'
                ? BooleanInputField(
                    inputField: inputField,
                    initialValue: getInitialValue(inputField),
                    onInputValueChange: (bool value) =>
                        onInputValueChange(inputField, value))
                : TodoInputField(
                    inputField: inputField,
                    onInputValueChange: (String value) =>
                        onInputValueChange(inputField, value),
                    initialValue: getInitialValue(inputField));
          }).toList(),
        ),
        Container(
          margin: EdgeInsets.only(left: 5.0, right: 4.0, top: 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    elevation: 10,
                    color: Colors.red,
                    onPressed: onCancel,
                    child: Text('Cancel',
                        style: UtilHelpers.getFontStyles(14.0, null)),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: onSaveTodoTask,
                    child: Text('Save',
                        style: UtilHelpers.getFontStyles(14.0, null)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

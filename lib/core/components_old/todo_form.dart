import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/page_state.dart';
import 'package:todo_app/core/components_old/todo_input_field.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_field.dart';
import 'package:todo_app/app_state/todo_state.dart';

class TodoForm extends StatelessWidget {
  final List<TodoField> labels = TodoField.getTodoFormFields();

  @override
  Widget build(BuildContext context) {
    final TodoState todoState = Provider.of<TodoState>(context);
    final PageState pageModel = Provider.of<PageState>(context, listen: false);
    Todo currentTodo = todoState.currentTodo;
    bool isNewTodo = currentTodo.id.isNotEmpty && currentTodo.title.isEmpty;

    void onCancel() {
      Navigator.of(context).pop();
    }

    bool isTodoReadyForSubmit() {
      return currentTodo != null &&
          currentTodo.id.isNotEmpty &&
          currentTodo.title.isNotEmpty;
    }

    void onSaveTodo() {
      bool isFormRead = isTodoReadyForSubmit();
      if (isFormRead) {
        todoState.addTodo(currentTodo);
        if (isNewTodo) {
          todoState.resetCurrentTodo();
          pageModel.activateTable(1);
        }
        onCancel();
      } else {
        print('Form not ready');
      }
    }

    void onInputValueChange(TodoField inputField, String value) {
      if (inputField.id == 'title') {
        currentTodo.title = value;
      } else if (inputField.id == 'description') {
        currentTodo.description = value;
      }
    }

    String getInitialValue(TodoField inputField) {
      return inputField.id == 'title'
          ? currentTodo.title
          : inputField.id == 'description' ? currentTodo.description : '';
    }

    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: labels
                .map((TodoField inputField) => TodoInputField(
                    inputField: inputField,
                    onInputValueChange: (String value) =>
                        onInputValueChange(inputField, value),
                    initialValue: getInitialValue(inputField)))
                .toList(),
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
                      onPressed: onSaveTodo,
                      child: Text('Save',
                          style: UtilHelpers.getFontStyles(14.0, null)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

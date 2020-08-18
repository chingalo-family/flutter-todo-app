import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/page_model.dart';
import 'package:todo_app/models/todo_field.dart';
import 'package:todo_app/app-state/todo_model.dart';

import 'Todo_input_field.dart';

class TodoForm extends StatelessWidget {
  final List<TodoField> labels = [
    TodoField(id: 'title', label: 'Title', inputType: ''),
    TodoField(id: 'description', label: 'Description', inputType: '')
  ];

  @override
  Widget build(BuildContext context) {
    final TodoModel todoModel = Provider.of<TodoModel>(context);
    final PageModel pageModel = Provider.of<PageModel>(context);
    final currentTodo = todoModel.currentTodo;

    void onCancel() {
      todoModel.resetCurrentTodo();
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
        todoModel.addTodo(currentTodo);
        // dynamic change tabs
        pageModel.activateTable(1);
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
          margin: EdgeInsets.only(left: 5.0, right: 4.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    elevation: 10,
                    color: Colors.red,
                    onPressed: onCancel,
                    child: Text('Cancel'),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: onSaveTodo,
                    child: Text('Save'),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}

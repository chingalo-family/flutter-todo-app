import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/todo_form_state.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/components/entry_forms/entry_form_container.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/form_section.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_task.dart';

class TodoFormContainer extends StatelessWidget {
  const TodoFormContainer({
    Key key,
    @required this.todoFormSections,
    @required this.todoTasks,
  }) : super(key: key);

  final List<FormSection> todoFormSections;
  final List<TodoTask> todoTasks;

  onInputValueChange(BuildContext context, String id, dynamic value) {
    Provider.of<TodoFormState>(context, listen: false)
        .setFormFieldState(id, value);
  }

  onSaveTodoForm(
    BuildContext context,
    Map mandatoryFieldObject,
  ) {
    try {
      List mandatoryFields = mandatoryFieldObject.keys.toList();
      Map dataObject =
          Provider.of<TodoFormState>(context, listen: false).formState;
      bool isMandatoryFieldsSet =
          AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
      if (isMandatoryFieldsSet) {
        Todo todo = Todo.fromMap(dataObject);
        todo.tasks = todoTasks;
        Provider.of<TodoState>(context, listen: false).addTodo(todo);
        AppUtil.showToastMessage(
          message: "Todo has been save successfully",
          position: ToastGravity.SNACKBAR,
        );
        Navigator.of(context).pop();
      } else {
        AppUtil.showToastMessage(
          message: "Please fill all mandatory fields",
          position: ToastGravity.TOP,
        );
      }
    } catch (error) {
      String errorMessage = error.toString();
      AppUtil.showToastMessage(
        message: "Errror on saving Todo : $errorMessage",
        position: ToastGravity.TOP,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Map mandatoryFieldObject = Map();
    mandatoryFieldObject['title'] = true;
    return Consumer<TodoFormState>(
      builder: (context, todoFormState, child) {
        return Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: EntryFormContainer(
                  elevation: 0.0,
                  isEditableMode: todoFormState.isEditableMode,
                  formSections: todoFormSections,
                  dataObject: todoFormState.formState,
                  hiddenFields: todoFormState.hiddenFields,
                  hiddenSections: todoFormState.hiddenSections,
                  mandatoryFieldObject: mandatoryFieldObject,
                  onInputValueChange: (id, value) =>
                      onInputValueChange(context, id, value),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Center(
                          child: FlatButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'Cancel',
                              style: TextStyle().copyWith(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Center(
                          child: FlatButton(
                            onPressed: () => onSaveTodoForm(
                              context,
                              mandatoryFieldObject,
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle().copyWith(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

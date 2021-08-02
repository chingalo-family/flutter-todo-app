import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/todo.dart';

class DeleteTodoConfirmation extends StatelessWidget {
  const DeleteTodoConfirmation({
    Key? key,
    required this.currentTodo,
  }) : super(key: key);

  final Todo currentTodo;

  onDeleteTodo(BuildContext context) async {
    await Provider.of<TodoState>(context, listen: false)
        .deleteTodo(currentTodo);
    AppUtil.showToastMessage(
      message: "${currentTodo.title} has been deleted successfully",
      position: ToastGravity.SNACKBAR,
    );
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Consumer<AppThemeState>(
              builder: (context, appThemeState, child) {
                String currentTheme = appThemeState.currentTheme;
                Color textColor = currentTheme == ThemeServices.darkTheme
                    ? AppContant.darkTextColor
                    : AppContant.ligthTextColor;
                return Container(
                  child: Text(
                    "Are you sure you want to delete '${currentTodo.title}' with ${currentTodo.tasks.length} tasks?",
                    style: TextStyle().copyWith(
                      color: textColor,
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                      child: TextButton(
                        onPressed: () => onDeleteTodo(context),
                        child: Text(
                          'Delete',
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
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          'Cancel',
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
  }
}

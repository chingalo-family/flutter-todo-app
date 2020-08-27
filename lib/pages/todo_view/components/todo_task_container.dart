import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/app_theme_state.dart';
import 'package:todo_app/core/providers/preference_provider.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class TodoTaskContainer extends StatelessWidget {
  const TodoTaskContainer(
      {Key key,
      @required this.todoTask,
      this.onDeleteTodoTask,
      this.onEditTodoTask})
      : super(key: key);
  final TodoTask todoTask;
  final VoidCallback onEditTodoTask;
  final VoidCallback onDeleteTodoTask;

  @override
  Widget build(BuildContext context) {
    String status = todoTask.isCompleted ? 'Completed' : 'Not completed';
    return Consumer<AppThemeState>(builder: (context, appThemeState, child) {
      String theme = appThemeState.currentTheme;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: theme == PreferenceProvider.darkTheme
                        ? ThemeData.dark().accentColor
                        : ThemeData().accentColor))),
        child: ListTile(
          title:
              Text(todoTask.title, style: UtilHelpers.getFontStyles(18, null)),
          subtitle: Text('Status $status',
              style: UtilHelpers.getFontStyles(15, null)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onEditTodoTask,
                child: Icon(Icons.edit),
              ),
              GestureDetector(
                onTap: onDeleteTodoTask,
                child: Icon(Icons.delete),
              )
            ],
          ),
        ),
      );
    });
  }
}

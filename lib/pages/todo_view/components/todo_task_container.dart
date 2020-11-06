import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo_task.dart';

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
                    color: theme == ThemeServices.darkTheme
                        ? ThemeData.dark().accentColor
                        : ThemeData().accentColor))),
        child: ListTile(
          title: InkWell(
            onTap: onEditTodoTask,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(todoTask.title,
                            style: UtilHelpers.getFontStyles(12, null).copyWith(
                                decoration: todoTask.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null)))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text('Status $status',
                            style: UtilHelpers.getFontStyles(15, null).copyWith(
                                decoration: todoTask.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null)))
                  ],
                ),
              ],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onEditTodoTask,
                child: buildIcon(Icons.edit),
              ),
              InkWell(
                onTap: onDeleteTodoTask,
                child: buildIcon(Icons.delete),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget buildIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}

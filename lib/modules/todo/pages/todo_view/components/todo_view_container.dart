import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/user_state.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/models/todo.dart';

import 'todo_summary_container.dart';
import 'todo_task_container.dart';

class TodoViewContainer extends StatelessWidget {
  const TodoViewContainer({
    Key? key,
    required this.currentTodo,
    this.onTapCurrentTodo,
  }) : super(key: key);

  final Todo currentTodo;
  final VoidCallback? onTapCurrentTodo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AppThemeState>(
        builder: (context, appThemeState, child) {
          String currentTheme = appThemeState.currentTheme;
          Color textColor = currentTheme == ThemeServices.darkTheme
              ? AppContant.darkTextColor
              : AppContant.ligthTextColor;
          return Consumer<UserState>(
            builder: (context, userState, child) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TodoSummaryContainer(
                      currentTodo: currentTodo,
                      textColor: textColor,
                      onTapCurrentTodo: onTapCurrentTodo,
                    ),
                    TodoTaskContainer(
                      currentTodo: currentTodo,
                      textColor: textColor,
                      currentUser: userState.currrentUser,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

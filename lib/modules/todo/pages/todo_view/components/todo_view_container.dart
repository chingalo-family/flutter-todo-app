import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/models/todo.dart';

class TodoViewContainer extends StatelessWidget {
  const TodoViewContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AppThemeState>(
        builder: (context, appThemeState, child) {
          String currentTheme = appThemeState.currentTheme;
          Color textColor = currentTheme == ThemeServices.darkTheme
              ? AppContant.darkTextColor
              : AppContant.ligthTextColor;
          return Container(
            child: Consumer<TodoState>(
              builder: (context, todoState, child) {
                Todo currentTodo = todoState.currentTodo;
                return Container(
                  child: Text(
                    currentTodo.toString(),
                    style: TextStyle().copyWith(
                      color: textColor,
                      fontSize: 20.0,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

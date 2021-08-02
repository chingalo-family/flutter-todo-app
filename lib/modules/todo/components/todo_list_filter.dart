import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';

class TodoListFilter extends StatelessWidget {
  const TodoListFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeState>(
      builder: (context, appThemeState, child) {
        String currentTheme = appThemeState.currentTheme;
        Color textColor = currentTheme == ThemeServices.darkTheme
            ? AppContant.darkTextColor
            : AppContant.ligthTextColor;
        return Container(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Todo list filters",
                style: TextStyle().copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                  color: textColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

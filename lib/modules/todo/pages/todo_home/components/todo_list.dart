import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/core/components/material_card.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key key,
    @required this.todo,
    this.onSelectTodo,
  }) : super(key: key);

  final Todo todo;
  final VoidCallback onSelectTodo;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeState>(
      builder: (context, appThemeState, child) {
        String currentTheme = appThemeState.currentTheme;
        Color textColor = currentTheme == ThemeServices.darkTheme
            ? AppContant.darkTextColor
            : AppContant.ligthTextColor;
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          child: GestureDetector(
            onTap: onSelectTodo,
            child: MaterialCard(
              body: Container(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 5.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                todo.title,
                                style: TextStyle().copyWith(
                                  fontSize: 18.0,
                                  color: textColor,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                todo.description,
                                style: TextStyle().copyWith(
                                  color: textColor,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Status : ${todo.isCompleted ? 'Completed' : 'Not completed'}',
                                style: TextStyle().copyWith(
                                  color: todo.isCompleted
                                      ? Color(0xFF34C759)
                                      : Colors.redAccent,
                                  fontSize: 12.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.chevron_right,
                        color: textColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

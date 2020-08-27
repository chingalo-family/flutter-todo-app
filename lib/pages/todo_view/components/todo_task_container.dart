import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/app_theme_state.dart';
import 'package:todo_app/core/providers/preference_provider.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class TodoTaskContainer extends StatelessWidget {
  const TodoTaskContainer({Key key, @required TodoTask todoTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => {},
                child: Icon(Icons.edit),
              ),
              GestureDetector(
                onTap: () => {},
                child: Icon(Icons.delete),
              )
            ],
          ),
          title:
              Text('Summary Chart', style: UtilHelpers.getFontStyles(18, null)),
          subtitle:
              Text('Chart to come', style: UtilHelpers.getFontStyles(15, null)),
        ),
      );
    });
  }
}

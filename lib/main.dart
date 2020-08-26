import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/app_theme_state.dart';
import 'package:todo_app/app-state/page_state.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/core/providers/preference_provider.dart';
import 'package:todo_app/pages/launch/launch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Todo App';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoState(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageState(),
        ),
        ChangeNotifierProvider(create: (_) => AppThemeState())
      ],
      child: Consumer<AppThemeState>(
          builder: (context, appThemeState, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appThemeState.currentTheme == PreferenceProvider.darkTheme
                  ? ThemeData.dark()
                  : null,
              home: LaunchPage())),
    );
  }
}

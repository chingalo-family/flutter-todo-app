import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_info_state.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/page_state.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/modules/splash/splash.dart';

class MyApp extends StatelessWidget {
  final String title = 'Todo App';

  @override
  Widget build(BuildContext context) {
    return buildApp();
  }

  MultiProvider buildApp() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoState(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageState(),
        ),
        ChangeNotifierProvider(create: (_) => AppThemeState()),
        ChangeNotifierProvider(create: (_) => AppInfoState())
      ],
      child: Consumer<AppThemeState>(
          builder: (context, appThemeState, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appThemeState.currentTheme == ThemeServices.darkTheme
                  ? ThemeData.dark()
                  : null,
              home: Splash())),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';

class AppDrawerContainer extends StatelessWidget {
  const AppDrawerContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<AppThemeState>(
      builder: (context, appThemeState, child) {
        String currentTheme = appThemeState.currentTheme;
        return Container(
          width: size.width * 0.8,
          height: size.height,
          decoration: BoxDecoration(
            color: currentTheme == ThemeServices.darkTheme
                ? AppContant.darkThemeColor
                : AppContant.lightThemeColor,
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.2,
                  child: Center(
                    child: Text(
                      'JC',
                      style: TextStyle().copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Detail for ',
                    style: TextStyle().copyWith(color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    'Log in and log out btn',
                    style: TextStyle().copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

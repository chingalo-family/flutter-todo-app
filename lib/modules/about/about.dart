import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_info_state.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/core/components/app_bar_container.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppContant.appBarHeight),
            child: AppBarContainer(
              title: 'About',
              isAboutPage: true,
              isAddVisible: false,
              isViewChartVisible: false,
            ),
          ),
          body: Consumer<AppThemeState>(
            builder: (context, appThemeState, child) {
              String currentTheme = appThemeState.currentTheme;
              Color textColor = currentTheme == ThemeServices.darkTheme
                  ? AppContant.darkTextColor
                  : AppContant.ligthTextColor;
              return Consumer<AppInfoState>(
                builder: (context, appInfoState, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Card(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.2,
                                  child: SvgPicture.asset(
                                    'assets/logos/todo-logo.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'App Name : ${appInfoState.currentAppName}',
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'App Version : ${appInfoState.currentAppVersion}',
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'App Id : ${appInfoState.currentAppId}',
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Device version : ${appInfoState.currentPlatformVersion}',
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_info_state.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/modules/todo/pages/todo_home/todo_home.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    setAppThemeAndInitialData(context);
  }

  setAppThemeAndInitialData(BuildContext context) async {
    AppThemeState appThemeState =
        Provider.of<AppThemeState>(context, listen: false);
    Timer(Duration(seconds: 1), () {
      ThemeServices.getCurrentTheme().then((theme) {
        appThemeState.setCurrentTheme(theme);
        Provider.of<TodoState>(context, listen: false).initiateTodoList();
        Provider.of<AppInfoState>(context, listen: false).setCurrentAppInfo();
        Timer(
          Duration(
            seconds: 2,
          ),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => TodoHome(),
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: size.height * 0.4,
                            width: size.width * 0.3,
                            child: SvgPicture.asset(
                              'assets/logos/todo-logo.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          CircularProgressIndicator(
                            strokeWidth: 4.0,
                            valueColor: new AlwaysStoppedAnimation(
                              const Color(0xFF00BFA6),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

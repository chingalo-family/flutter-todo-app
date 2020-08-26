import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/app_theme_state.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/core/providers/http_provider.dart';
import 'package:todo_app/core/providers/preference_provider.dart';
import 'package:todo_app/pages/home/home.dart';

class LaunchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LaunchPageState();
  }
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TodoState todoState = Provider.of<TodoState>(context, listen: false);
    final AppThemeState appThemeState =
        Provider.of<AppThemeState>(context, listen: false);
    initiateData() async {
      todoState.initiateTodoList();
      String theme = await PreferenceProvider.getCurrentTheme();
      appThemeState.setCurrentTheme(theme);
      await HttpProvider.getCurrentUser();
      Timer(
          Duration(seconds: 3),
          () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()))
              });
    }

    initiateData();

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
                              'images/logos/todo-logo.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: new AlwaysStoppedAnimation(
                                const Color(0xFF00BFA6)),
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

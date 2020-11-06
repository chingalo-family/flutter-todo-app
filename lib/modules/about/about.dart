import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_info_state.dart';
import 'package:todo_app/core/components/app_pop_up_menu.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'About',
            style: TextStyle().copyWith(
              fontSize: 14.0,
            ),
          ),
          actions: [
            AppPopUpMenu(
              currentPage: 'about',
            )
          ],
        ),
        body: Consumer<AppInfoState>(
          builder: (context, appInfoState, child) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: SingleChildScrollView(
                child: Center(
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'App Name : ${appInfoState.currentAppName}',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    'App Version : ${appInfoState.currentAppVersion}',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('App Id : ${appInfoState.currentAppId}',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    'Device version : ${appInfoState.currentPlatformVersion}',
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                    )),
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
        ),
      )),
    );
  }
}

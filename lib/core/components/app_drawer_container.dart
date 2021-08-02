import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/user_state.dart';
import 'package:todo_app/core/components/user_forms/sign_in_sign_up_form_container.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/user.dart';

class AppDrawerContainer extends StatelessWidget {
  const AppDrawerContainer({
    Key? key,
  }) : super(key: key);

  onSignInOrSignOut(BuildContext context, User currentUser) async {
    if (currentUser.isLogin) {
      print("sign out the user");
    } else {
      Widget modal = SignInSignUpFormContainer();
      User user = await AppUtil.showPopUpModal(context, modal, false);
      print(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      child: Consumer<AppThemeState>(
        builder: (context, appThemeState, child) {
          String currentTheme = appThemeState.currentTheme;
          return Consumer<UserState>(
            builder: (context, userState, child) {
              String usernameIcon = userState.usernameIcon;
              User currentUser = userState.currrentUser;
              return Container(
                width: size.width * 0.8,
                height: size.height,
                decoration: BoxDecoration(
                  color: currentTheme == ThemeServices.darkTheme
                      ? AppContant.darkThemeColor
                      : AppContant.lightThemeColor,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.05,
                          bottom: size.height * 0.025,
                        ),
                        height: size.height * 0.1,
                        child: Visibility(
                          visible: currentUser.isLogin,
                          child: Center(
                            child: CircleAvatar(
                              radius: size.height * 0.05,
                              child: Text(
                                usernameIcon,
                                style: TextStyle().copyWith(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.65,
                        child: Visibility(
                          visible: currentUser.isLogin,
                          child: Container(
                            child: Text(''),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: TextButton(
                            onPressed: () =>
                                onSignInOrSignOut(context, currentUser),
                            child: Text(
                              currentUser.isLogin ? 'Sign Out' : 'Sign In',
                              style: TextStyle().copyWith(
                                color: currentTheme == ThemeServices.darkTheme
                                    ? AppContant.darkTextColor
                                    : AppContant.ligthLabelTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

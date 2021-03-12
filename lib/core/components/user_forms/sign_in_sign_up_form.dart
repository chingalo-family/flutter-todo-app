import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/core/components/user_forms/sign_in_form.dart';
import 'package:todo_app/core/components/user_forms/sign_up_form.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';

class SignInSignUpForm extends StatefulWidget {
  const SignInSignUpForm({
    Key key,
  }) : super(key: key);

  @override
  _SignInSignUpFormState createState() => _SignInSignUpFormState();
}

class _SignInSignUpFormState extends State<SignInSignUpForm> {
  bool _showSignInForm = true;

  void onChangeFormState() {
    //@TODO clean form states
    _showSignInForm = !_showSignInForm;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer<AppThemeState>(
      builder: (context, appThemeState, child) {
        String currentTheme = appThemeState.currentTheme;
        Color textColor = currentTheme == ThemeServices.darkTheme
            ? AppContant.darkTextColor
            : AppContant.ligthTextColor;
        return Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _showSignInForm
                    ? SignInForm(
                        currentTheme: currentTheme,
                      )
                    : SignUpForm(
                        currentTheme: currentTheme,
                      ),
              ),
              Container(
                child: GestureDetector(
                  onTap: onChangeFormState,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 70.0,
                      bottom: 5.0,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: '',
                        children: [
                          TextSpan(
                            text: _showSignInForm
                                ? "Don't have account?"
                                : 'Have account already?',
                            style: TextStyle().copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                              color: textColor.withOpacity(0.5),
                            ),
                          ),
                          TextSpan(
                            text: _showSignInForm ? ' Sign up' : ' Sign in',
                            style: TextStyle().copyWith(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}

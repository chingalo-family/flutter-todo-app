import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key key,
    @required this.currentTheme,
  }) : super(key: key);

  final String currentTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("sign up form"),
    );
  }
}

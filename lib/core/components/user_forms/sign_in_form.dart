import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.currentTheme,
  }) : super(key: key);

  final String currentTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("sign in form"),
    );
  }
}

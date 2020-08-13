import 'package:flutter/material.dart';

class UtilHelpers{

  static showAddTodoForm(BuildContext context, String title, Widget content) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            elevation: 5.0,
            scrollable: true,
            clipBehavior: Clip.hardEdge,
            content:content,
          );
        });
  }

}
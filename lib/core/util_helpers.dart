import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class UtilHelpers {
  static showAddTodoForm(BuildContext context, String title, Widget content) {
    Size size = MediaQuery.of(context).size;
    double height = size.height * 0.5;
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
              margin:
                  EdgeInsets.symmetric(vertical: height / 2, horizontal: 50),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [content],
              ));
        });
  }

  static String getUid() {
    return Uuid().v1().replaceAll('-', '').substring(0, 10);
  }

  static TextStyle getFontStyles(
    double fontSize,
    Color color,
  ) {
    return GoogleFonts.caveat(
        fontSize: fontSize ?? null,
        color: color ?? null,
        fontWeight: FontWeight.normal);
  }
}

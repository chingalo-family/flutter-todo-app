import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:random_color/random_color.dart';

class UtilHelpers {
  static showPopUpModal(BuildContext context, String title, Widget modal) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [modal],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Color getRamdomCalor() {
    RandomColor _randomColor = RandomColor();
    return _randomColor.randomColor();
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

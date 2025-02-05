import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class AppUtil {
  static bool hasAllMandarotyFieldsFilled(
    List mandatoryFields,
    Map dataObject,
  ) {
    bool hasFilled = true;
    List fieldIds = dataObject.keys.toList();
    for (var mandatoryField in mandatoryFields) {
      if (fieldIds.indexOf(mandatoryField) == -1) {
        hasFilled = false;
      } else {
        hasFilled = '${dataObject[mandatoryField]}'.trim() != '';
      }
    }
    return hasFilled;
  }

  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: Brightness.light));
  }

  static String getUid() {
    Random rnd = new Random();
    const letters = 'abcdefghijklmnopqrstuvwxyz' + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const allowedChars = '0123456789' + letters;
    const NUMBER_OF_CODEPOINTS = allowedChars.length;
    const CODESIZE = 11;
    String uid;
    int charIndex = (rnd.nextInt(10) / 10 * letters.length).round();
    uid = letters.substring(charIndex, charIndex + 1);
    for (int i = 1; i < CODESIZE; ++i) {
      charIndex = (rnd.nextInt(10) / 10 * NUMBER_OF_CODEPOINTS).round();
      uid += allowedChars.substring(charIndex, charIndex + 1);
    }
    return uid;
  }

  static String formattedDateTimeIntoString(DateTime date) {
    return date.toIso8601String().split('T')[0];
  }

  static getTimeDifferenceInHours(
    String startDateTime,
    String endDateTime,
  ) {
    DateTime current = DateTime.parse(startDateTime);
    Duration differenceInTime = current.difference(DateTime.parse(endDateTime));
    double numberOfHours =
        differenceInTime.inHours + (differenceInTime.inMinutes / 60);
    return numberOfHours.toStringAsFixed(2);
  }

  static DateTime getDateIntoDateTimeFormat(String date) {
    return DateTime.parse(date);
  }

  static Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }

  static int getAgeInYear(String dateOfBirth) {
    int age = 0;
    try {
      DateTime currentDate = DateTime.now();
      DateTime birthDate = dateOfBirth != null && dateOfBirth != ''
          ? getDateIntoDateTimeFormat(dateOfBirth)
          : getDateIntoDateTimeFormat(formattedDateTimeIntoString(currentDate));
      age = currentDate.year - birthDate.year;
      if (birthDate.month > currentDate.month) {
        age--;
      } else if (birthDate.month == currentDate.month) {
        if (birthDate.day > currentDate.day) {
          age--;
        }
      }
    } catch (e) {}
    return age;
  }

  static showToastMessage({
    String message,
    ToastGravity position = ToastGravity.BOTTOM,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: position,
      backgroundColor: Color(0xFF656565),
    );
  }

  static showPopUpModal(
    BuildContext context,
    Widget modal,
    bool diablePadding,
  ) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Container(
              child: Padding(
                padding: diablePadding
                    ? const EdgeInsets.all(0.0)
                    : const EdgeInsets.only(
                        bottom: 12.0,
                        top: 5.0,
                        right: 5.0,
                        left: 5.0,
                      ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 10.0,
                                ),
                                child: Icon(Icons.close, size: 18.0),
                              ),
                            )
                          ],
                        ),
                      ),
                      modal
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

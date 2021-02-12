import 'package:flutter/foundation.dart';
import 'package:todo_app/models/user.dart';

class UserState with ChangeNotifier {
  // initial state
  User _currentUser = User(
    username: "chingalo",
    fullName: "joseph philibert chingalo",
    emial: "profschingalo@gmail.com",
  );

  // selectors
  User get currrentUser => _currentUser;

  String get usernameIcon => _currentUser != null && _currentUser.isLogin
      ? _currentUser.fullName
          .split(" ")
          .map((name) => "$name"[0] ?? "")
          .toList()
          .join("")
          .toUpperCase()
      : "";

  // reducers

}

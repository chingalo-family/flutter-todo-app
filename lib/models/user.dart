import 'package:todo_app/core/utils/util_helpers.dart';

class User {
  String id;
  String username;
  String fullName;
  String password;
  String emial;
  String phoneNumber;

  User({
    this.username,
    this.emial,
    this.fullName,
    this.password,
    this.phoneNumber,
  }) {
    this.id = UtilHelpers.getUid();
  }

  @override
  String toString() {
    return '$id';
  }
}

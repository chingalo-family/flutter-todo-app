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

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['id'] = user.id;
    data['username'] = user.username;
    data['fullName'] = user.fullName;
    data['password'] = user.password;
    data['emial'] = user.emial;
    data['phoneNumber'] = user.phoneNumber;
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.username = mapData['username'];
    this.fullName = mapData['fullName'];
    this.password = mapData['password'];
    this.emial = mapData['emial'];
    this.phoneNumber = mapData['phoneNumber'];
  }

  @override
  String toString() {
    return 'Group <$id : $username>';
  }
}

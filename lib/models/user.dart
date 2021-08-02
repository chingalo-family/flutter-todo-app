import 'package:todo_app/core/utils/app_util.dart';

class User {
  late String id;
  late String username;
  late String fullName;
  late String? password;
  late String? emial;
  late String? phoneNumber;
  late bool isLogin;

  User({
    required this.username,
    this.emial,
    required this.fullName,
    this.password,
    this.phoneNumber,
    this.isLogin = false,
  }) {
    this.id = AppUtil.getUid();
  }

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    data['password'] = this.password;
    data['emial'] = this.emial;
    data['phoneNumber'] = this.phoneNumber;
    data['isLogin'] = this.isLogin ? '1' : '0';
    return data;
  }

  User.fromMap(Map mapData) {
    this.id = mapData['id'];
    this.username = mapData['username'];
    this.fullName = mapData['fullName'];
    this.password = mapData['password'];
    this.emial = mapData['emial'];
    this.phoneNumber = mapData['phoneNumber'];
    this.isLogin = mapData['isLogin'] == "1";
  }

  @override
  String toString() {
    return 'User <$id : $username>';
  }
}

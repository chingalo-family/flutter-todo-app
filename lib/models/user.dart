import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_util.dart';

class User {
  String id;
  String username;
  String fullName;
  String password;
  String emial;
  String phoneNumber;
  bool isLogin;

  User({
    @required this.username,
    this.emial,
    @required this.fullName,
    this.password,
    this.phoneNumber,
    this.isLogin = true,
  }) {
    this.id = AppUtil.getUid();
  }

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['id'] = user.id;
    data['username'] = user.username;
    data['fullName'] = user.fullName;
    data['password'] = user.password;
    data['emial'] = user.emial;
    data['phoneNumber'] = user.phoneNumber;
    data['isLogin'] = user.isLogin ? '1' : '0';
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
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

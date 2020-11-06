import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_util.dart';

class UserGroup {
  String id;
  String name;
  String description;

  UserGroup({
    @required this.name,
    this.description,
  }) {
    this.id = AppUtil.getUid();
    this.description = this.description ?? '';
  }

  Map toMap(UserGroup userGroup) {
    var data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }

  UserGroup.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.name = mapData['name'];
    this.description = mapData['description'];
  }

  @override
  String toString() {
    return 'Group <$id : $name>';
  }
}

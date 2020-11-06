import 'package:todo_app/core/utils/util_helpers.dart';

class UserGroup {
  String id;
  String name;
  String description;

  UserGroup({
    this.name,
    this.description,
  }) {
    this.id = UtilHelpers.getUid();
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

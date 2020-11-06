import 'package:todo_app/core/utils/app_util.dart';

class UserGroupMember {
  String id;
  String groupId;
  String userId;
  String username;
  String fullName;

  UserGroupMember({
    this.groupId,
    this.userId,
  }) {
    this.id = AppUtil.getUid();
  }

  Map toMap(UserGroupMember userGroupMember) {
    var data = Map<String, dynamic>();
    data['id'] = this.id;
    data['groupId'] = this.groupId;
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    return data;
  }

  UserGroupMember.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.groupId = mapData['groupId'];
    this.userId = mapData['userId'];
    this.username = mapData['username'];
    this.fullName = mapData['fullName'];
  }

  @override
  String toString() {
    return 'Group Member <$id >';
  }
}

import 'package:todo_app/core/utils/util_helpers.dart';

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
    this.id = UtilHelpers.getUid();
  }

  @override
  String toString() {
    return '$id';
  }
}

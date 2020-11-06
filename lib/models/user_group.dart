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

  @override
  String toString() {
    return '$id';
  }
}

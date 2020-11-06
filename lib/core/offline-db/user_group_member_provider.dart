import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/user_group_member.dart';

import 'db_provider.dart';

class UserGroupMemberProvider extends DbProvider {
  final String tableName = 'user_group_member';
  //Columns
  final String id = 'id';
  final String groupId = 'groupId';
  final String userId = 'userId';
  final String username = 'username';
  final String fullName = 'fullName';

  addOrUpdateTodoTask(UserGroupMember userGroupMember) async {
    var dbClient = await db;
    await dbClient.insert(tableName, userGroupMember.toMap(userGroupMember),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteTodoTask(String userGroupMemberId) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: '$id = ?', whereArgs: [userGroupMemberId]);
  }

  Future<List<UserGroupMember>> getTodoTasks() async {
    List<UserGroupMember> userGroupMembers = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(tableName,
          columns: [
            id,
          ],
          orderBy: 'isCompleted');
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          userGroupMembers.add(UserGroupMember.fromMap(map));
        }
      }
    } catch (e) {
      print(e);
    }
    return userGroupMembers;
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/user_group.dart';
import 'db_provider.dart';

class UserGroupProvider extends DbProvider {
  final String tableName = 'user_group';
  // columns
  final String id = 'id';
  final String name = 'name';
  final String description = 'description';

  addOrUpdateUserGroup(UserGroup userGroup) async {
    var dbClient = await db;
    await dbClient.insert(tableName, userGroup.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteUserGroup(String userGroupId) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: '$id = ?', whereArgs: [userGroupId]);
  }

  Future<List<UserGroup>> getTodoTasks() async {
    List<UserGroup> userGroups = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(tableName,
          columns: [
            id,
            name,
            description,
          ],
          orderBy: 'isCompleted');
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          userGroups.add(UserGroup.fromMap(map));
        }
      }
    } catch (e) {
      print(e);
    }
    return userGroups;
  }
}

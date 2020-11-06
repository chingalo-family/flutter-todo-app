import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/user.dart';

import 'db_provider.dart';

class UserProvider extends DbProvider {
  final String tableName = 'user';
  // columns
  final String id = 'id';
  final String username = 'username';
  final String fullName = 'fullName';
  final String password = 'password';
  final String emial = 'emial';
  final String phoneNumber = 'phoneNumber';

  addOrUpdateUser(User user) async {
    var dbClient = await db;
    await dbClient.insert(tableName, user.toMap(user),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteUser(String userId) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: '$id = ?', whereArgs: [userId]);
  }

  Future<List<User>> getUsers() async {
    List<User> users = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(tableName,
          columns: [
            id,
            username,
            fullName,
            password,
            emial,
            phoneNumber,
          ],
          orderBy: 'username');
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          users.add(User.fromMap(map));
        }
      }
    } catch (e) {
      print(e);
    }
    return users;
  }
}

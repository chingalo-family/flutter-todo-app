import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/offline-db/db_provider.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends DbProvider {
  String tableName = "todo";

  // columns
  final String id = 'id';
  final String title = 'title';
  final String description = 'description';
  final String createdOn = 'createdOn';

  addOrUpdateTodo(Todo todo) async {
    var dbClient = await db;
    await dbClient.insert(tableName, todo.toMap(todo),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteTodo(String todoId) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: '$id = ?', whereArgs: [todoId]);
  }

  Future<List<Todo>> getTodos() async {
    List<Todo> todoList = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        tableName,
        columns: [id, title, description],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          todoList.add(Todo.fromMap(map));
        }
      }
    } catch (e) {
      print(e);
    }
    return todoList;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
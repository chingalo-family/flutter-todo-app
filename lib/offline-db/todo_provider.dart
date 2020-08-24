import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/offline-db/db_provider.dart';

class TodoProvider extends DbProvider {
  Database _db;
  String tableName = "todo";

  // columns
  String id = 'id';
  String title = 'title';
  String description = 'description';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    return _db;
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$databaseName.db');
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String createTableQuery =
        "CREATE TABLE IF NOT EXISTS $tableName ($id TEXT PRIMARY KEY, $title TEXT, $description TEXT)";
    await db.execute(createTableQuery);
  }

  addTodo(Todo todo) async {
    var dbClient = await db;
    await dbClient.insert(tableName, todo.toMap(todo),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteTodo(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName, where: '$id = ?', whereArgs: [id]);
  }

  updateLogs(Todo todo) async {
    var dbClient = await db;
    await dbClient.update(
      tableName,
      todo.toMap(todo),
      where: '$id = ?',
      whereArgs: [todo.id],
    );
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

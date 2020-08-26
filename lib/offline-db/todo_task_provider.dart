import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/offline-db/db_provider.dart';

class TodoTaskProvider extends DbProvider {
  Database _db;
  String tableName = "todo_task";

  // columns
  String id = 'id';
  String title = 'title';
  String todoId = 'todoId';
  String isCompleted = 'isCompleted';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    this._onCreate(_db, version);
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
        "CREATE TABLE IF NOT EXISTS $tableName ($id TEXT PRIMARY KEY, $todoId INTEGER, $title TEXT, $isCompleted INTEGER)";
    await db.execute(createTableQuery);
  }

  addTodoTask(TodoTask todoTask) async {
    var dbClient = await db;
    await dbClient.insert(tableName, todoTask.toMap(todoTask));
  }

  deleteTodoTask(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName, where: '$id = ?', whereArgs: [id]);
  }

  updateTodoTask(TodoTask todoTask) async {
    var dbClient = await db;
    await dbClient.update(
      tableName,
      todoTask.toMap(todoTask),
      where: '$id = ?',
      whereArgs: [todoTask.id],
    );
  }

  Future<List<TodoTask>> getTodoTasks() async {
    List<TodoTask> todoTaskList = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        tableName,
        columns: [
          id,
          todoId,
          title,
          isCompleted,
        ],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          todoTaskList.add(TodoTask.fromMap(map));
        }
      }
    } catch (e) {
      print(e);
    }
    return todoTaskList;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}

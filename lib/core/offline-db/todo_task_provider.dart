import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/offline-db/db_provider.dart';
import 'package:todo_app/models/todo_task.dart';

class TodoTaskProvider extends DbProvider {
  String tableName = "todo_task";

  // columns
  final String id = 'id';
  final String title = 'title';
  final String todoId = 'todoId';
  final String isCompleted = 'isCompleted';
  final String createdOn = 'createdOn';
  final String dueDate = 'dueDate';
  final String completedOn = 'completedOn';
  final String completedBy = 'completedBy';
  final String createdBy = 'createdBy';
  final String assignedTo = 'assignedTo';

  addOrUpdateTodoTask(TodoTask todoTask) async {
    var dbClient = await db;
    await dbClient!.insert(tableName, todoTask.toMap(todoTask),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteTodoTask(String todoTaskId) async {
    var dbClient = await db;
    return await dbClient!
        .delete(tableName, where: '$id = ?', whereArgs: [todoTaskId]);
  }

  Future<List<TodoTask>> getTodoTasks() async {
    List<TodoTask> todoTaskList = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient!.query(tableName,
          columns: [
            id,
            todoId,
            title,
            isCompleted,
            createdOn,
            createdBy,
            dueDate,
            completedOn,
            completedBy,
            assignedTo,
          ],
          orderBy: 'isCompleted');
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
}

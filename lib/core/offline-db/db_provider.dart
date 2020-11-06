import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  Database _db;

  final String databaseName = "todo_app_v2";
  // Script for migrations as well as intialization of tables
  final List<String> initialQuery = [
    "CREATE TABLE IF NOT EXISTS todo ( id TEXT PRIMARY KEY, title TEXT, description TEXT,createdOn TEXT,createdBy TEXT,dueDate TEXT,completedOn TEXT,completedBy TEXT,assignedTo TEXT,groupId TEXT)",
    "CREATE TABLE IF NOT EXISTS todo_task (id TEXT PRIMARY KEY, todoId INTEGER, title TEXT, isCompleted INTEGER, createdOn TEXT,createdBy TEXT,dueDate TEXT,completedOn TEXT,completedBy TEXT,assignedTo TEXT)",
    "CREATE TABLE IF NOT EXISTS user (id TEXT PRIMARY KEY, username TEXT, fullName TEXT, password TEXT, emial TEXT, phoneNumber TEXT)",
    "CREATE TABLE IF NOT EXISTS user_group (id TEXT PRIMARY KEY, name TEXT, description TEXT)",
    "CREATE TABLE IF NOT EXISTS user_group_member (id TEXT PRIMARY KEY, userId TEXT, groupId TEXT)"
  ];

  final List<String> migrationQuery = [];

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    this.onCreate(_db, migrationQuery.length + 1);
    return _db;
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$databaseName.db');
    return await openDatabase(
      path,
      version: migrationQuery.length + 1,
      onUpgrade: onUpgrade,
      onCreate: onCreate,
    );
  }

  onCreate(Database db, int version) async {
    for (String query in initialQuery) {
      await db.execute(query);
    }
  }

  onUpgrade(Database db, int oldVersion, int version) async {
    for (String query in migrationQuery) {
      await db.execute(query);
    }
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}

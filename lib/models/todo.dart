import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/todo_task.dart';

class Todo {
  String id;
  String title;
  String description;
  String createdOn;
  String createdBy;
  String dueDate;
  String completedOn;
  String completedBy;
  bool isCompleted;
  String assignedTo;
  String groupId;

  List<TodoTask> tasks;

  Todo({
    @required this.title,
    @required this.description,
    this.createdOn,
    @required this.assignedTo,
    this.completedBy,
    this.completedOn,
    this.createdBy,
    this.isCompleted = false,
    this.dueDate,
    this.groupId,
  }) {
    this.id = AppUtil.getUid();
    this.groupId = this.groupId ?? "";
    this.tasks = [];
    this.isCompleted = this.isCompleted ?? false;
  }

  Map toMap(Todo todo) {
    var data = Map<String, dynamic>();
    data['id'] = todo.id;
    data['title'] = todo.title;
    data['description'] = todo.description;
    data['createdOn'] = todo.createdOn;
    data['assignedTo'] = todo.assignedTo;
    data['completedBy'] = todo.completedBy;
    data['completedOn'] = todo.completedOn;
    data['createdBy'] = todo.createdBy;
    data['dueDate'] = todo.dueDate;
    data['groupId'] = todo.groupId;
    return data;
  }

  Todo.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.title = mapData['title'];
    this.description = mapData['description'];
    this.createdOn = mapData['createdOn'] ?? '';
    this.assignedTo = mapData['assignedTo'] ?? '';
    this.completedBy = mapData['completedBy'] ?? '';
    this.completedOn = mapData['completedOn'] ?? '';
    this.completedBy = mapData['completedBy'] ?? '';
    this.assignedTo = mapData['assignedTo'] ?? '';
    this.groupId = mapData['groupId'] ?? '';
  }

  @override
  String toString() {
    return 'Todo <$id $title>';
  }
}

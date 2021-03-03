import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/contants/app_contant.dart';
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
  String completedTasks;

  List<TodoTask> tasks;

  Todo({
    @required this.title,
    @required this.description,
    this.createdOn,
    this.assignedTo,
    this.completedBy,
    this.completedOn,
    this.createdBy,
    this.isCompleted = false,
    this.dueDate,
    this.groupId,
  }) {
    this.id = AppUtil.getUid();
    this.assignedTo = this.assignedTo ?? AppContant.defaultUserId;
    this.groupId = this.groupId ?? AppContant.defaultUserGroupId;
    this.tasks = [];
    this.createdOn = AppUtil.formattedDateTimeIntoString(DateTime.now());
  }

  Map toMap() {
    var data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createdOn'] = this.createdOn;
    data['assignedTo'] = this.assignedTo;
    data['completedBy'] = this.completedBy;
    data['completedOn'] = this.completedOn;
    data['createdBy'] = this.createdBy;
    data['dueDate'] = this.dueDate;
    data['groupId'] = this.groupId;
    return data;
  }

  Todo.fromMap(Map mapData) {
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

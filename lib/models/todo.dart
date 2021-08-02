import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/todo_task.dart';

class Todo {
  late String id;
  late String title;
  late String description;
  late String createdOn;
  late String createdBy;
  late String dueDate;
  late String completedOn;
  late String completedBy;
  late bool isCompleted;
  late String assignedTo;
  late String groupId;
  late String completedTasks;

  late List<TodoTask> tasks;

  Todo({
    required this.title,
    required this.description,
    this.createdOn = "",
    this.assignedTo = "",
    this.completedBy = "",
    this.completedOn = "",
    this.createdBy = "",
    this.isCompleted = false,
    this.dueDate = "",
    this.groupId = "",
  }) {
    this.id = AppUtil.getUid();
    this.assignedTo =
        this.assignedTo != "" ? this.assignedTo : AppContant.defaultUserId;
    this.createdBy =
        this.createdBy != "" ? this.createdBy : AppContant.defaultUserId;
    this.groupId =
        this.groupId != "" ? this.groupId : AppContant.defaultUserGroupId;
    this.tasks = [];
    this.createdOn = DateTime.now().toString().split(".")[0];
  }

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createdOn'] = this.createdOn;
    data['assignedTo'] = this.assignedTo;
    data['completedBy'] = this.completedBy;
    data['completedOn'] = this.completedOn;
    data['createdBy'] = this.createdBy != "" ? this.createdBy : "";
    data['dueDate'] = this.dueDate != "" ? this.dueDate : "";
    data['groupId'] = this.groupId;
    return data;
  }

  Todo.fromMap(Map mapData) {
    this.id = mapData['id'];
    this.title = mapData['title'];
    this.description = mapData['description'];
    this.createdOn = mapData['createdOn'] ?? '';
    this.assignedTo = mapData['assignedTo'] ?? AppContant.defaultUserId;
    this.completedBy = mapData['completedBy'] ?? '';
    this.completedOn = mapData['completedOn'] ?? '';
    this.createdBy = mapData['createdBy'] ?? AppContant.defaultUserId;
    this.dueDate = mapData['dueDate'] ?? '';
    this.assignedTo = mapData['assignedTo'] ?? AppContant.defaultUserId;
    this.groupId = mapData['groupId'] ?? AppContant.defaultUserGroupId;
  }

  @override
  String toString() {
    return 'Todo <$id $title>';
  }
}

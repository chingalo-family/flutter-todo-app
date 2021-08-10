import 'package:todo_app/core/utils/app_util.dart';

class TodoTask {
  late String id;
  late String todoId;
  late String title;
  late bool isCompleted;
  late String createdOn;
  late String createdBy;
  late String completedOn;
  late String completedBy;
  late String assignedTo;
  late String dueDate;

  TodoTask({
    required this.todoId,
    required this.title,
    required this.isCompleted,
  }) {
    this.id = AppUtil.getUid();
    this.createdOn = DateTime.now().toString().split(".")[0];
    this.createdBy = "";
    this.dueDate = "";
    this.assignedTo = "";
    this.completedBy = "";
    this.completedOn = "";
  }

  Map<String, dynamic> toMap(TodoTask todoTask) {
    var data = Map<String, dynamic>();
    data['id'] = todoTask.id;
    data['todoId'] = todoTask.todoId;
    data['title'] = todoTask.title;
    data['isCompleted'] = todoTask.isCompleted ? 1 : 0;
    data['createdBy'] = todoTask.createdBy;
    data['createdOn'] = todoTask.createdOn;
    data['assignedTo'] = todoTask.assignedTo;
    data['completedBy'] = todoTask.completedBy;
    data['assignedTo'] = todoTask.assignedTo;
    data['dueDate'] = todoTask.dueDate;
    data['completedOn'] = todoTask.completedOn;
    return data;
  }

  TodoTask.fromMap(Map mapData) {
    this.id = mapData['id'];
    this.todoId = mapData['todoId'];
    this.title = mapData['title'];
    this.createdOn = mapData['createdOn'] ?? '';
    this.assignedTo = mapData['assignedTo'] ?? '';
    this.createdBy = mapData['createdBy'] ?? '';
    this.completedOn = mapData['completedOn'] ?? '';
    this.completedBy = mapData['completedBy'] ?? '';
    this.assignedTo = mapData['assignedTo'] ?? '';
    this.dueDate = mapData['dueDate'] ?? '';
    this.isCompleted = '${mapData['isCompleted']}' == '1' ||
        '${mapData['isCompleted']}' == 'true';
  }

  @override
  String toString() {
    return 'Todo task <$id : $title>';
  }
}

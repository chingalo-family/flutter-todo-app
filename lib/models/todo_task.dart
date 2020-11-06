import 'package:todo_app/core/utils/util_helpers.dart';

class TodoTask {
  String id;
  String todoId;
  String title;
  bool isCompleted;
  String createdOn;
  String createdBy;
  String completedOn;
  String completedBy;
  String assignedTo;
  String dueDate;

  TodoTask({this.todoId, this.title, this.isCompleted}) {
    this.id = UtilHelpers.getUid();
    this.isCompleted = this.isCompleted ?? false;
  }

  Map toMap(TodoTask todoTask) {
    var data = Map<String, dynamic>();
    data['id'] = todoTask.id;
    data['todoId'] = todoTask.todoId;
    data['title'] = todoTask.title;
    data['isCompleted'] = todoTask.isCompleted ? 1 : 0;
    data['createdOn'] = todoTask.createdOn ?? '';
    data['assignedTo'] = todoTask.assignedTo ?? '';
    data['completedBy'] = todoTask.completedBy ?? '';
    data['assignedTo'] = todoTask.assignedTo ?? '';
    data['dueDate'] = todoTask.dueDate ?? '';
    data['completedOn'] = todoTask.completedOn ?? '';
    return data;
  }

  TodoTask.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.todoId = mapData['todoId'];
    this.createdOn = mapData['createdOn'] ?? '';
    this.assignedTo = mapData['assignedTo'] ?? '';
    this.completedBy = mapData['completedBy'] ?? '';
    this.completedOn = mapData['completedOn'] ?? '';
    this.completedBy = mapData['completedBy'] ?? '';
    this.assignedTo = mapData['assignedTo'] ?? '';
    this.dueDate = mapData['dueDate'] ?? '';
    this.isCompleted = '${mapData['isCompleted']}' == '1';
  }

  @override
  String toString() {
    return 'Todo task <$id : $title>';
  }
}

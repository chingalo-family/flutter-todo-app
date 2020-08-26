class Todo {
  String id;
  String title;
  String description;
  List<TodoTask> tasks;

  Todo({
    this.id,
    this.title,
    this.description,
  }) {
    this.tasks = [];
  }

  Map toMap(Todo todo) {
    var data = Map<String, dynamic>();
    data['id'] = todo.id;
    data['title'] = todo.title;
    data['description'] = todo.description;
    return data;
  }

  Todo.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.title = mapData['title'];
    this.description = mapData['description'];
  }

  @override
  String toString() {
    return 'id $id title $title description $description';
  }
}

class TodoTask {
  String id;
  String todoId;
  String title;
  bool isCompleted;

  TodoTask({this.id, this.todoId, this.title, this.isCompleted});

  Map toMap(TodoTask todoTask) {
    var data = Map<String, dynamic>();
    data['id'] = todoTask.id;
    data['todoId'] = todoTask.todoId;
    data['title'] = todoTask.title;
    data['isCompleted'] = todoTask.isCompleted ? 1 : 0;
    return data;
  }

  TodoTask.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.todoId = mapData['todoId'];
    this.title = mapData['title'];
    this.isCompleted = '${mapData['isCompleted']}' == '1';
  }

  @override
  String toString() {
    return 'Todo task <$id : $title>';
  }
}

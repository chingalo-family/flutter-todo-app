import 'package:flutter/foundation.dart';
import 'package:todo_app/models/todo.dart';
import 'package:uuid/uuid.dart';

class TodoModel extends ChangeNotifier {
  // initial state of todo_list
  final List<Todo> todoState = [];
  Todo _currentTodo;

  // selector for state
  List<Todo> get todoList => todoState.toList();

  int get todoCount => todoState.toString().length;

  Todo get currentTodo =>
      _currentTodo ?? new Todo(id: Uuid().v1(), title: '', description: '');

  bool get isTodoReadyForSubmit =>
      _currentTodo.id.isNotEmpty &&
      _currentTodo.title.isNotEmpty &&
      _currentTodo.description.isNotEmpty;

  // actions on reducers
  void setCurrentTodo(Todo todo) {
    _currentTodo =
        new Todo(id: todo.id, title: todo.title, description: todo.description);
    notifyListeners();
  }

  void addTodo(Todo todo) {
    todoState.add(todo);
    notifyListeners();
  }
}

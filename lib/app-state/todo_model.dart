import 'package:flutter/foundation.dart';
import 'package:todo_app/core/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class TodoModel extends ChangeNotifier {
  // initial state of todo_list
  List<Todo> todoState = [];
  Todo _currentTodo;

  // selector for state
  List<Todo> get todoList => todoState.toList();

  int get todoCount => todoState.toString().length;

  Todo get currentTodo =>
      _currentTodo ??
      new Todo(id: UtilHelpers.getUid(), title: '', description: '');

  // actions on reducers
  void setCurrentTodo(Todo todo) {
    _currentTodo =
        new Todo(id: todo.id, title: todo.title, description: todo.description);
    notifyListeners();
  }

  void resetCurrentTodo() {
    _currentTodo = null;
    notifyListeners();
  }

  void addTodo(Todo todo) {
    todoState = todoState.where((Todo d) => d.id != todo.id).toList();
    // todoState.add(todo);
    todoState.insert(0, todo);
    notifyListeners();
  }
}

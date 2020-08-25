import 'package:flutter/foundation.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/offline-db/todo_provider.dart';

class TodoModel extends ChangeNotifier {
  // initial state of todo_list
  TodoProvider todoProvider = new TodoProvider();
  List<Todo> _todoList = [];
  Todo _currentTodo;

  // selector for state
  List<Todo> get todoList => _todoList.toList();

  int get todoCount => _todoList.toString().length;

  Todo get currentTodo =>
      _currentTodo ??
      new Todo(id: UtilHelpers.getUid(), title: '', description: '');

  // actions on reducers

  void initiateTodoList() async {
    _todoList = await todoProvider.getTodos();
    notifyListeners();
  }

  void setCurrentTodo(Todo todo) {
    _currentTodo =
        new Todo(id: todo.id, title: todo.title, description: todo.description);
    notifyListeners();
  }

  void resetCurrentTodo() {
    _currentTodo = null;
    notifyListeners();
  }

  void addTodo(Todo todo) async {
    await todoProvider.addTodo(todo);
    initiateTodoList();
  }
}

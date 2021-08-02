import 'package:flutter/foundation.dart';
import 'package:todo_app/core/offline-db/todo_provider.dart';
import 'package:todo_app/core/offline-db/todo_task_provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_task.dart';

class TodoState with ChangeNotifier {
  // initial state of todo_list
  final TodoProvider todoProvider = new TodoProvider();
  final TodoTaskProvider todoTaskProvider = new TodoTaskProvider();

  List<Todo> _todoList = [];
  Todo? _currentTodo;

  // selector for state
  List<Todo> get todoList => _todoList.toList();

  int get todoCount => _todoList.toList().length;

  Todo? get currentTodo => _currentTodo;

  // actions on reducers
  void initiateTodoList() async {
    List<Todo> todos = await todoProvider.getTodos();
    List<TodoTask> todoTasks = await todoTaskProvider.getTodoTasks();
    _todoList = todos.map((Todo todo) {
      String todoId = todo.id;
      todo.tasks = todoTasks
          .where((TodoTask todoTask) => todoTask.todoId == todoId)
          .toList();
      List<bool> completenesStatus =
          todo.tasks.map((TodoTask todoTask) => todoTask.isCompleted).toList();
      todo.isCompleted = !completenesStatus.contains(false);
      List<TodoTask> completedTasks = todo.tasks
          .where((TodoTask todoTask) => todoTask.isCompleted)
          .toList();
      todo.completedTasks = "${completedTasks.length}";
      return todo;
    }).toList();
    if (_currentTodo != null && _currentTodo!.id.isNotEmpty) {
      int index =
          _todoList.indexWhere((Todo todo) => todo.id == _currentTodo!.id);
      _currentTodo = _todoList[index];
    }
    notifyListeners();
  }

  void setCurrentTodo(Todo todo) {
    _currentTodo = todo;
    notifyListeners();
  }

  void resetCurrentTodo() {
    _currentTodo = null;
    notifyListeners();
  }

  void addTodo(Todo todo) async {
    await todoProvider.addOrUpdateTodo(todo);
    initiateTodoList();
  }

  Future deleteTodo(Todo todo) async {
    await todoProvider.deleteTodo(todo.id);
    for (TodoTask todoTask in todo.tasks) {
      await todoTaskProvider.deleteTodoTask(todoTask.id);
    }
    _currentTodo = null;
    initiateTodoList();
  }

  void addTodoTask(TodoTask todoTask) async {
    await todoTaskProvider.addOrUpdateTodoTask(todoTask);
    initiateTodoList();
  }

  Future deleteTodoTask(TodoTask todoTask) async {
    await todoTaskProvider.deleteTodoTask(todoTask.id);
    initiateTodoList();
  }
}

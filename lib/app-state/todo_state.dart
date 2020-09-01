import 'package:flutter/foundation.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/offline-db/todo_provider.dart';
import 'package:todo_app/offline-db/todo_task_provider.dart';

class TodoState extends ChangeNotifier {
  // initial state of todo_list
  TodoProvider todoProvider = new TodoProvider();
  TodoTaskProvider todoTaskProvider = new TodoTaskProvider();

  List<Todo> _todoList = [];
  Todo _currentTodo;

  // selector for state
  List<Todo> get todoList => _todoList.toList();

  int get todoCount => _todoList.toList().length;

  Todo get currentTodo =>
      _currentTodo ??
      new Todo(id: UtilHelpers.getUid(), title: '', description: '');

  // actions on reducers
  void initiateTodoList() async {
    List<Todo> todos = await todoProvider.getTodos();
    List<TodoTask> todoTasks = await todoTaskProvider.getTodoTasks();
    _todoList = todos.map((Todo todo) {
      String todoId = todo.id;
      todo.tasks = todoTasks
          .where((TodoTask todoTask) => todoTask.todoId == todoId)
          .toList();
      return todo;
    }).toList();
    if (_currentTodo != null && _currentTodo.id.isNotEmpty) {
      int index =
          _todoList.indexWhere((Todo todo) => todo.id == _currentTodo.id);
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

  void deleteTodoTask(TodoTask todoTask) async {
    await todoTaskProvider.deleteTodoTask(todoTask.id);
    initiateTodoList();
  }
}

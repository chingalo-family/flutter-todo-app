import 'package:flutter/foundation.dart';

class Todo {
  String id,title, description;

  Todo({
    this.id,
    this.title,
    this.description,
  });
}

class TodoModel extends ChangeNotifier{

  // initial state of todo_list
  final List<Todo> todoState = [];

  // selector for state
  List<Todo> get todoList=> todoState.toList();

  int get todoCount=> todoState.toString().length;


  // actions / reducers

  void addTodo(Todo todo){
    todo.id = todo.id != null ? todo.id: todo.title;
    todoState.add(todo);
    notifyListeners();
  }
}

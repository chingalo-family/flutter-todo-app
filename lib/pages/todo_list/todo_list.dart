import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/todo_list/components/todo_container.dart';

class TodoList extends StatelessWidget {
  TodoList({
    Key key,
    this.todoList,
    this.onSelectTodo
  }) : super(key: key);

  final Function(Todo) onSelectTodo;

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context,int index){
            return TodoContainer(todo: this.todoList[index],onSelectTodo:onSelectTodo);
          }),
    );
  }
}

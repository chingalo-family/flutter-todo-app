import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoContainer extends StatelessWidget{
  TodoContainer({Key key, this.todo,this.onSelectTodo}): super(key: key);

  final Todo todo;
  final Function(Todo) onSelectTodo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          return onSelectTodo(todo);
        },
        title: Text(todo.title),
        subtitle: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,              
              children: <Widget>[
                Text(todo.description, style: TextStyle(fontSize: 11),),
                Text(todo.description, style: TextStyle(fontSize: 11),)
              ]
          ),
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoListDetail extends StatelessWidget {
  TodoListDetail({
    Key key,
    this.currentTodo
  }) : super(key: key);

  final Todo currentTodo;


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        margin: EdgeInsets.all(10),
        height: height,
        width: width,
        child: Text('')
    );
  }
}

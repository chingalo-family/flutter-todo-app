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
      padding: EdgeInsets.only(top: 10,),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Title : ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                  Text(currentTodo.title),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Description : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                  Text(currentTodo.description, style: TextStyle(fontSize: 12),),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

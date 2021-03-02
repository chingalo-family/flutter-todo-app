import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/form_section.dart';
import 'package:todo_app/models/todo.dart';

class TodoTaskFormContainer extends StatelessWidget {
  const TodoTaskFormContainer({
    Key key,
    @required this.todoFormSections,
    @required this.currentTodo,
  }) : super(key: key);

  final List<FormSection> todoFormSections;
  final Todo currentTodo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Todo task forms $todoFormSections $currentTodo"),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_task.dart';
import 'package:todo_app/modules/todo/pages/todo_view/components/todo_task_card.dart';

class TodoTaskContainer extends StatelessWidget {
  const TodoTaskContainer({
    Key key,
    @required this.textColor,
    @required this.currentTodo,
  }) : super(key: key);

  final Color textColor;
  final Todo currentTodo;

  onEditTodoTask(BuildContext context, TodoTask todoTask) {
    print("On edit todo task $todoTask");
  }

  onDeleteTodoTask(BuildContext context, TodoTask todoTask) {
    print("On delete todo task $todoTask");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "${currentTodo.title}'s list of tasks",
              style: TextStyle().copyWith(
                fontSize: 18.0,
                color: textColor,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: currentTodo.tasks
                  .map((TodoTask todoTask) => Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: TodoTaskCard(
                          textColor: textColor,
                          todoTask: todoTask,
                          onEdit: () => onEditTodoTask(context, todoTask),
                          onDelete: () => onDeleteTodoTask(context, todoTask),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

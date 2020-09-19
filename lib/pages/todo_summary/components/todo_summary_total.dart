import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class TodoSummaryTotal extends StatelessWidget {
  const TodoSummaryTotal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                left:
                    BorderSide(color: UtilHelpers.getRamdomCalor(), width: 5))),
        child: Consumer<TodoState>(
          builder: (context, todoState, child) {
            List<Todo> todoList = todoState.todoList;

            int totalTodo = todoState.todoCount;
            int todoWithAllCompletedTasks = todoList
                .where((Todo todo) {
                  return todo.tasks
                          .where((TodoTask task) => !task.isCompleted)
                          .toList()
                          .length ==
                      0;
                })
                .toList()
                .length;
            int todoWithInCompletedTasks =
                totalTodo - todoWithAllCompletedTasks;
            return ListTile(
              title: Column(
                children: [
                  Text(
                    'Todo Summary',
                    style: UtilHelpers.getFontStyles(14.0, null),
                  )
                ],
              ),
              subtitle: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Total Todos: $totalTodo',
                            style: UtilHelpers.getFontStyles(14.0, null))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                                'Incompleted tasks : $todoWithInCompletedTasks',
                                style: UtilHelpers.getFontStyles(
                                    14.0, Colors.redAccent))),
                        Expanded(
                            child: Text(
                                'Completed tasks : $todoWithAllCompletedTasks',
                                style: UtilHelpers.getFontStyles(
                                    14.0, Colors.blueAccent)))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

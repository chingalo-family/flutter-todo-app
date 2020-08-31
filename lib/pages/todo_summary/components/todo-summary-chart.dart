import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class TodoSummaryChart extends StatelessWidget {
  TodoSummaryChart({
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
            List<TodoTask> todoTask = [];
            for (Todo todo in todoState.todoList) {
              todoTask.addAll(todo.tasks);
            }
            int completedTasks =
                todoTask.where((TodoTask task) => task.isCompleted).length;
            int inCompletedTasks =
                todoTask.where((TodoTask task) => !task.isCompleted).length;
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text('Status of Task',
                      style: UtilHelpers.getFontStyles(20.0, null)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text('Incompleted Task : $inCompletedTasks',
                            style: UtilHelpers.getFontStyles(18.0, null)
                                .copyWith(color: Colors.redAccent)),
                      ),
                      Container(
                        child: Text('Completed Task : $completedTasks',
                            style: UtilHelpers.getFontStyles(18.0, null)),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

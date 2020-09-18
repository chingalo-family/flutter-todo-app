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

  List<charts.Series<TaskStatus, String>> getSeriesData(List<Todo> todoList) {
    List<TodoTask> todoTask = [];
    for (Todo todo in todoList) {
      todoTask.addAll(todo.tasks);
    }
    int completedTasks =
        todoTask.where((TodoTask task) => task.isCompleted).length;
    int inCompletedTasks =
        todoTask.where((TodoTask task) => !task.isCompleted).length;

    List<charts.Series<TaskStatus, String>> _seriesPieData =
        List<charts.Series<TaskStatus, String>>();
    var piedata = [
      new TaskStatus('Completed Tasks', completedTasks, Colors.blueAccent),
      new TaskStatus('In completed Tasks', inCompletedTasks, Colors.redAccent),
    ];
    _seriesPieData.add(
      charts.Series(
        domainFn: (TaskStatus task, _) => task.status,
        measureFn: (TaskStatus task, _) => task.value,
        colorFn: (TaskStatus task, _) =>
            charts.ColorUtil.fromDartColor(task.color),
        id: 'task-status',
        data: piedata,
        labelAccessorFn: (TaskStatus row, _) => '${row.value}',
      ),
    );
    return _seriesPieData;
  }

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
            int totalTodos = todoState.todoCount;
            for (Todo todo in todoState.todoList) {
              todoTask.addAll(todo.tasks);
            }
            int completedTasks =
                todoTask.where((TodoTask task) => task.isCompleted).length;
            int inCompletedTasks =
                todoTask.where((TodoTask task) => !task.isCompleted).length;
            List<charts.Series<TaskStatus, String>> _seriesPieData =
                getSeriesData(todoState.todoList);
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text('Status of Task',
                      style: UtilHelpers.getFontStyles(14.0, null)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text('Incompleted Task : $inCompletedTasks',
                            style: UtilHelpers.getFontStyles(12.0, null)
                                .copyWith(color: Colors.redAccent)),
                      ),
                      Container(
                        child: Text('Completed Task : $completedTasks',
                            style: UtilHelpers.getFontStyles(12.0, null)
                                .copyWith(color: Colors.blueAccent)),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: totalTodos > 0 &&
                      (completedTasks > 0 || inCompletedTasks > 0),
                  child: Container(
                      width: 200,
                      height: 300,
                      child: charts.PieChart(
                        _seriesPieData,
                        defaultRenderer: new charts.ArcRendererConfig(),
                      )),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class TaskStatus {
  final String status;
  final int value;
  final Color color;

  TaskStatus(this.status, this.value, this.color);
}

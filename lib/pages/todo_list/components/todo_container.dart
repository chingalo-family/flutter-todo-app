import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo_view/todo_view.dart';

class TodoContainer extends StatelessWidget {
  TodoContainer({this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoState = Provider.of<TodoState>(context, listen: false);
    int completedTasks =
        todo.tasks.where((TodoTask task) => task.isCompleted).length;
    int inCompletedTasks =
        todo.tasks.where((TodoTask task) => !task.isCompleted).length;

    return Container(
      child: Card(
          child: Container(
        decoration: BoxDecoration(
            border: Border(
                left:
                    BorderSide(color: UtilHelpers.getRamdomCalor(), width: 5))),
        child: ListTile(
          onTap: () {
            todoState.setCurrentTodo(todo);
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return TodoView();
              },
            ));
          },
          title: Text(
            todo.title,
            style: UtilHelpers.getFontStyles(20.0, null),
          ),
          subtitle: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'description : ${todo.description}',
                    style: UtilHelpers.getFontStyles(18.0, null),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Incomplete Tasks : $inCompletedTasks ',
                        style: UtilHelpers.getFontStyles(18.0, null)
                            .copyWith(color: Colors.redAccent),
                      ),
                      Text(
                        'Complete Tasks : $completedTasks ',
                        style: UtilHelpers.getFontStyles(18.0, null),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      )),
    );
  }
}

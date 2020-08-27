import 'package:flutter/material.dart';
import 'package:todo_app/core/components/todo_task_form.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo_view/components/delete_todo_task_confirmation.dart';
import 'package:todo_app/pages/todo_view/components/todo_task_container.dart';

class TodoViewContainer extends StatelessWidget {
  const TodoViewContainer(
      {Key key, @required this.todo, @required this.onEditTodoDetails})
      : super(key: key);

  final Todo todo;
  final VoidCallback onEditTodoDetails;

  @override
  Widget build(BuildContext context) {
    onEditTodoTask(TodoTask todoTask) {
      Widget content = Container(
          child: TodoTaskForm(
        todo: todo,
        todoTask: todoTask,
        isNewTask: false,
      ));
      return UtilHelpers.showPopUpModal(context, content);
    }

    onDeleteTodoTask(TodoTask todoTask) {
      Widget content = Container(
          child: DeleteTodoTaskConfirmation(
        todo: todo,
        todoTask: todoTask,
      ));
      return UtilHelpers.showPopUpModal(context, content);
    }

    return Column(
      children: <Widget>[
        Card(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: UtilHelpers.getRamdomCalor(), width: 5))),
            child: Column(
              children: [
                ListTile(
                  onTap: this.onEditTodoDetails,
                  title: Text(
                    todo.title,
                    style: UtilHelpers.getFontStyles(20.0, null),
                  ),
                  subtitle: Text(todo.description,
                      style: UtilHelpers.getFontStyles(18.0, null)),
                ),
              ],
            ),
          ),
        ),
        Container(
            child: Text('Tasks List',
                style: UtilHelpers.getFontStyles(20.0, null))),
        Visibility(
            visible: todo.tasks.length == 0,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: UtilHelpers.getRamdomCalor(), width: 5))),
                child: ListTile(
                  title: Text(
                      'You have ${todo.tasks.length} tasks click (+) to add',
                      style: UtilHelpers.getFontStyles(18.0, null)),
                ),
              ),
            )),
        Card(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: UtilHelpers.getRamdomCalor(), width: 5))),
            child: Column(
              children: todo.tasks
                  .map((TodoTask todoTask) => TodoTaskContainer(
                        todoTask: todoTask,
                        onDeleteTodoTask: () {
                          onDeleteTodoTask(todoTask);
                        },
                        onEditTodoTask: () {
                          onEditTodoTask(todoTask);
                        },
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}

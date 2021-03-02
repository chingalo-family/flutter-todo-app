import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/form_section.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_task.dart';
import 'package:todo_app/modules/todo/helpers/todo_task_form_state_helper.dart';
import 'package:todo_app/modules/todo/models/todo_task_form.dart';
import 'package:todo_app/modules/todo/pages/todo_view/components/todo_task_card.dart';
import 'package:todo_app/modules/todo/pages/todo_view/components/todo_task_form_container.dart';

class TodoTaskContainer extends StatefulWidget {
  const TodoTaskContainer({
    Key key,
    @required this.textColor,
    @required this.currentTodo,
  }) : super(key: key);

  final Color textColor;
  final Todo currentTodo;

  @override
  _TodoTaskContainerState createState() => _TodoTaskContainerState();
}

class _TodoTaskContainerState extends State<TodoTaskContainer> {
  onEditTodoTask(
    BuildContext context,
    TodoTask todoTask,
  ) async {
    TodoTaskFormStateHelper.updateFormState(
        context, todoTask, !todoTask.isCompleted);
    String currentTheme =
        Provider.of<AppThemeState>(context, listen: false).currentTheme;
    Color textColor = currentTheme == ThemeServices.darkTheme
        ? AppContant.darkTextColor
        : AppContant.ligthTextColor;
    final List<FormSection> todoTaskFormSections =
        TodoTaskForm.getFormSections(textColor);
    Widget modal = TodoTaskFormContainer(
      todoTaskFormSections: todoTaskFormSections,
    );
    await AppUtil.showPopUpModal(context, modal, false);
  }

  onDeleteTodoTask(
    BuildContext context,
    TodoTask todoTask,
  ) {
    print("On delete todo task $todoTask");
  }

  onUpdateTodoTaskStatus(
    BuildContext context,
    TodoTask todoTask,
    bool isCompleted,
  ) {
    todoTask.isCompleted = isCompleted;
    Provider.of<TodoState>(context, listen: false).addTodoTask(todoTask);
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
              "${widget.currentTodo.title}'s list of tasks",
              style: TextStyle().copyWith(
                fontSize: 18.0,
                color: widget.textColor,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.currentTodo.tasks
                  .map(
                    (TodoTask todoTask) => Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: TodoTaskCard(
                        textColor: widget.textColor,
                        todoTask: todoTask,
                        onEdit: () => onEditTodoTask(context, todoTask),
                        onDelete: () => onDeleteTodoTask(context, todoTask),
                        onUpdateTodoTaskStatus: (bool isCompleted) =>
                            onUpdateTodoTaskStatus(
                          context,
                          todoTask,
                          isCompleted,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

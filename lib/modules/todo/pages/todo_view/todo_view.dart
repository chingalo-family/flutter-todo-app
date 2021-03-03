import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/todo_form_state.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/app_state/todo_task_form_state.dart';
import 'package:todo_app/app_state/user_state.dart';
import 'package:todo_app/core/components/app_bar_container.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/form_section.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/todo_task.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/modules/todo/helpers/todo_form_state_helper.dart';
import 'package:todo_app/modules/todo/helpers/todo_task_form_state_helper.dart';
import 'package:todo_app/modules/todo/models/todo_form.dart';
import 'package:todo_app/modules/todo/components/todo_form_container.dart';
import 'package:todo_app/modules/todo/models/todo_task_form.dart';
import 'package:todo_app/modules/todo/pages/todo_view/components/delete_todo_confirmation.dart';
import 'package:todo_app/modules/todo/pages/todo_view/components/todo_task_form_container.dart';

import 'components/todo_view_container.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key key}) : super(key: key);

  onAddTodoTask(
    BuildContext context,
    Todo currentTodo,
    User currentUser,
  ) async {
    TodoTask todoTask =
        TodoTask(todoId: currentTodo.id, title: "", isCompleted: false);
    todoTask.assignedTo = currentUser.id;
    todoTask.createdBy = currentUser.fullName;
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

  onEditTodo(BuildContext context, Todo currentTodo) async {
    bool isEditableMode = true;
    TodoFormStateHelper.updateFormState(
      context,
      currentTodo,
      isEditableMode,
    );
    String currentTheme =
        Provider.of<AppThemeState>(context, listen: false).currentTheme;
    Color textColor = currentTheme == ThemeServices.darkTheme
        ? AppContant.darkTextColor
        : AppContant.ligthTextColor;
    final List<FormSection> todoFormSections =
        TodoForm.getFormSections(textColor);
    Widget modal = TodoFormContainer(
      todoFormSections: todoFormSections,
      todoTasks: currentTodo.tasks,
    );
    await AppUtil.showPopUpModal(context, modal, false);
  }

  onDeleteTodo(BuildContext context, Todo currentTodo) async {
    Widget modal = DeleteTodoConfirmation(
      currentTodo: currentTodo,
    );
    bool hasTodoDeleted = await AppUtil.showPopUpModal(context, modal, false);
    try {
      if (hasTodoDeleted) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      print(error.toString());
    }
  }

  onOpenTodoChartSummary(BuildContext context, Todo currentTodo) {
    print("on opening todo chart $currentTodo");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserState>(
      builder: (context, userState, child) {
        return Consumer<TodoState>(
          builder: (context, todoState, child) {
            Todo currentTodo = todoState.currentTodo;
            return SafeArea(
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(AppContant.appBarHeight),
                  child: AppBarContainer(
                    title: currentTodo.title,
                    isAboutPage: false,
                    isAddVisible: true,
                    isViewChartVisible: true,
                    isDeleteVisible: true,
                    isEditVisible: true,
                    onAdd: () => onAddTodoTask(
                        context, currentTodo, userState.currrentUser),
                    onEdit: () => onEditTodo(context, currentTodo),
                    onDelete: () => onDeleteTodo(context, currentTodo),
                    onOpenChart: () =>
                        onOpenTodoChartSummary(context, currentTodo),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: TodoViewContainer(
                      currentTodo: currentTodo,
                      onTapCurrentTodo: () => onEditTodo(context, currentTodo),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

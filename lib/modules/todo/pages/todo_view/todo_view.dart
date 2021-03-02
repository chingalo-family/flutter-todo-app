import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/app_state/todo_form_state.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/components/app_bar_container.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/form_section.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/modules/todo/models/todo_form.dart';
import 'package:todo_app/modules/todo/pages/todo_home/components/todo_form_container.dart';

import 'components/todo_view_container.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key key}) : super(key: key);

  onAddTodoTask(BuildContext context, Todo currentTodo) {
    print("on add todo tasks $currentTodo");
  }

  onEditTodo(BuildContext context, Todo currentTodo) async {
    updateTodoFormState(context, currentTodo, !currentTodo.isCompleted);
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

  onDeleteTodo(BuildContext context, Todo currentTodo) {
    print("On deleting");
    //Navigator.of(context).pop();
  }

  onOpenTodoChartSummary(BuildContext context, Todo currentTodo) {
    print("on opening todo chart $currentTodo");
  }

  updateTodoFormState(
    BuildContext context,
    Todo todo,
    bool isEditableMode,
  ) {
    Provider.of<TodoFormState>(context, listen: false).resetFormState();
    Provider.of<TodoFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (todo != null) {
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState('id', todo.id);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState('title', todo.title);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState('description', todo.description);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("assignedTo", todo.assignedTo);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("createdBy", todo.createdBy);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("createdOn", todo.createdOn);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("dueDate", todo.dueDate);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("groupId", todo.groupId);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("completedOn", todo.completedOn);
      Provider.of<TodoFormState>(context, listen: false)
          .setFormFieldState("completedBy", todo.completedBy);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                onAdd: () => onAddTodoTask(context, currentTodo),
                onEdit: () => onEditTodo(context, currentTodo),
                onDelete: () => onDeleteTodo(context, currentTodo),
                onOpenChart: () => onOpenTodoChartSummary(context, currentTodo),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

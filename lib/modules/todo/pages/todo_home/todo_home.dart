import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/app_theme_state.dart';
import 'package:todo_app/core/components/app_bar_container.dart';
import 'package:todo_app/core/components/app_drawer_container.dart';
import 'package:todo_app/core/services/theme_service.dart';
import 'package:todo_app/core/utils/app_util.dart';
import 'package:todo_app/models/form_section.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/modules/todo/components/todo_list_filter.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/modules/todo/models/todo_form.dart';
import 'package:todo_app/modules/todo/pages/todo_home/components/todo_form_container.dart';

import 'components/todo_list_container.dart';

class TodoHome extends StatelessWidget {
  onAddTodo(BuildContext context) async {
    String currentTheme =
        Provider.of<AppThemeState>(context, listen: false).currentTheme;
    Color textColor = currentTheme == ThemeServices.darkTheme
        ? AppContant.darkTextColor
        : AppContant.ligthTextColor;
    final List<FormSection> todoFormSections =
        TodoForm.getFormSections(textColor);
    Widget modal = TodoFormContainer(todoFormSections: todoFormSections);
    Todo todo = await AppUtil.showPopUpModal(context, modal, false);
    print(todo);
  }

  onOpenTodoListChartSummary(BuildContext context) {
    print("on opening todo list chart");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawerContainer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppContant.appBarHeight),
          child: AppBarContainer(
            title: 'Todo List',
            isAboutPage: false,
            isAddVisible: true,
            isViewChartVisible: true,
            onAdd: () => onAddTodo(context),
            onOpenChart: () => onOpenTodoListChartSummary(context),
          ),
        ),
        body: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppContant.todoListFilterHeight),
            child: TodoListFilter(),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: TodoListContainer(),
            ),
          ),
        ),
      ),
    );
  }
}

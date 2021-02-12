import 'package:flutter/material.dart';
import 'package:todo_app/core/components/app_bar_container.dart';
import 'package:todo_app/core/components/app_drawer_container.dart';
import 'package:todo_app/modules/todo/components/todo_list_filter.dart';
import 'package:todo_app/core/contants/app_contant.dart';

import 'components/todo_list_container.dart';

class TodoHome extends StatelessWidget {
  onAddTodo(BuildContext context) {
    print("on add todo in list");
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
            isAddTodoVisible: true,
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

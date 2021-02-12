import 'package:flutter/material.dart';
import 'package:todo_app/core/components/app_bar_container.dart';
import 'package:todo_app/core/contants/app_contant.dart';

import 'components/todo_view_container.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key key}) : super(key: key);

  onAddTodo(BuildContext context) {
    print("on add todo tasks");
  }

  onOpenTodoListChartSummary(BuildContext context) {
    print("on opening todo chart");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppContant.appBarHeight),
          child: AppBarContainer(
            title: 'Todo View',
            isAboutPage: false,
            isAddTodoVisible: true,
            isViewChartVisible: true,
            onAdd: () => onAddTodo(context),
            onOpenChart: () => onOpenTodoListChartSummary(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: TodoViewContainer(),
          ),
        ),
      ),
    );
  }
}

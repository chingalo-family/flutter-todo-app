import 'package:flutter/material.dart';
import 'package:todo_app/core/components/app_bar_container.dart';
import 'package:todo_app/core/components/app_drawer_container.dart';
import 'package:todo_app/core/contants/app_contant.dart';

class TodoHome extends StatefulWidget {
  TodoHome({Key key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  onAddTodo(BuildContext context) {
    print("onOpenTodoListChartSummary");
  }

  onOpenTodoListChartSummary(BuildContext context) {
    print("onOpenTodoListChartSummary");
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
        body: Container(child: Text('form')),
      ),
    );
  }
}

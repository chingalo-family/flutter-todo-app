import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/components/app_bar_container.dart';
import 'package:todo_app/core/contants/app_contant.dart';
import 'package:todo_app/models/todo.dart';

import 'components/todo_view_container.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key key}) : super(key: key);

  onAddTodoTask(BuildContext context, Todo currentTodo) {
    print("on add todo tasks $currentTodo");
  }

  onEditTodo(BuildContext context, Todo currentTodo) {
    print("on add todo tasks $currentTodo");
  }

  onDeleteTodo(BuildContext context, Todo currentTodo) {
    print("on add todo tasks $currentTodo");
  }

  onOpenTodoChartSummary(BuildContext context, Todo currentTodo) {
    print("on opening todo chart $currentTodo");
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
                isAddVisible: false,
                isViewChartVisible: true,
                isDeleteVisible: true,
                isEditVisible: true,
                onEdit: () => onAddTodoTask(context, currentTodo),
                onDelete: () => onAddTodoTask(context, currentTodo),
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () => onAddTodoTask(context, currentTodo),
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        );
      },
    );
  }
}

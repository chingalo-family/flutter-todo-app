import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/todo_state.dart';
import 'package:todo_app/core/components/app_pop_up_menu.dart';
import 'package:todo_app/core/components/todo_form.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo_view/components/todo_view_container.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onEditTodoDetails() {
      Widget content = Container(child: TodoForm());
      return UtilHelpers.showPopUpModal(context, '', content);
    }

    addTodoTask(Todo todo) {}

    return SafeArea(
      child: Consumer<TodoState>(
        builder: (context, todoState, child) {
          Todo todo = todoState.currentTodo;
          return Scaffold(
              appBar: AppBar(
                title: Text(todo.title,
                    style: UtilHelpers.getFontStyles(30.0, null)),
                actions: [AppPopUpMenu()],
              ),
              body: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TodoViewContainer(
                  todo: todo,
                  onEditTodoDetails: onEditTodoDetails,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterDocked,
              floatingActionButton: FloatingActionButton(
                onPressed: () => {addTodoTask(todo)},
                child: Icon(Icons.add),
              ));
        },
      ),
    );
  }
}

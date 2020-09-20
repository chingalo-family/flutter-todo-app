import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_state/todo_state.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo_list/components/todo_container.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Consumer<TodoState>(
        builder: (context, todoState, child) {
          List<Todo> todoList = todoState.todoList;
          return todoList.length == 0
              ? Card(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: UtilHelpers.getRamdomCalor(),
                                width: 5))),
                    child: ListTile(
                      title: Text(
                          'You have ${todoList.length} todo click (+) to add',
                          style: UtilHelpers.getFontStyles(12.0, null)),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoContainer(todo: todoList[index]);
                  });
        },
      ),
    );
  }
}

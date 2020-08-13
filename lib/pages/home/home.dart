import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/todo_form.dart';
import 'package:todo_app/core/util_helpers.dart';
import 'package:todo_app/app-state/page_model.dart';
import 'package:todo_app/pages/todo_list/todo_list.dart';
import 'package:todo_app/pages/todo_summary/todo_summary.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<PageModel>(context);

    int currentIndex = pageModel.currentIndex;
    String currentPageTitle = pageModel.currentPageTitle;

    void setCurrentPageTitle(String name) {
      context.read<PageModel>().setCurrentPageTitle(name);
    }

    void setCurrentPageTab(int index) {
      String name = index == 0
          ? 'Todo App - Summary'
          : index == 1 ? 'Todo App - List' : 'Todo App';
      setCurrentPageTitle(name);
      pageModel.activateTable(index);
    }

    showAddTodoForm(BuildContext context) {
      String title = 'Todo Form';
      Widget content = Container(child: TodoForm());
      return UtilHelpers.showAddTodoForm(context, title, content);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(currentPageTitle),
        ),
        body: SafeArea(
            child: Container(
                child:  currentIndex == 1 ? TodoList() : TodoSummary())),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            return setCurrentPageTab(index);
          },
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: currentIndex,
          selectedFontSize: 13.0,
          unselectedFontSize: 12.0,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home', style: TextStyle(fontSize: 12.0))),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_numbered),
                title: Text('Todo', style: TextStyle(fontSize: 12.0)))
          ],
        ),
        floatingActionButton: Visibility(
            child: FloatingActionButton(
              onPressed: () {
                //return addTodo();
                showAddTodoForm(context);
              },
              child: Icon(Icons.add),
            ),
            visible:  true),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

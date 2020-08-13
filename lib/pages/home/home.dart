import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/page_model.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/todo_list/todo_list.dart';
import 'package:todo_app/pages/todo_list_detail/todo_list_detail.dart';
import 'package:todo_app/pages/todo_summary/todo_summary.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context);
    final pageModel = Provider.of<PageModel>(context);

    List<Todo> todoList = todoModel.todoList;
    int currentIndex = pageModel.currentIndex;
    String currentSubPage = pageModel.currentSubPage;
    String currentPageTitle = pageModel.currentPageTitle;

    void setCurrentPageTitle(String name) {
      context.read<PageModel>().setCurrentPageTitle(name);
    }

    void setCurrentSubPage(String name) {
      context.read<PageModel>().setCurrentSubPage(name);
    }

    void setCurrentPageTab(int index) {
      String name = index == 0
          ? 'Todo App - Summary'
          : index == 1 ? 'Todo App - List' : 'Todo App';
      setCurrentPageTitle(name);
      context.read<PageModel>().activateTable(index);
    }

    void addTodo() {
      int total = todoList.length;
      String id = '$total';
      String title = 'title $total';
      String description = 'description $total';
      Todo todo = new Todo(id: id, title: title, description: description);
      todoModel.addTodo(todo);
      setCurrentSubPage('');
      setCurrentPageTitle('Todo App - List');
      setCurrentPageTab(1);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(currentPageTitle),
        ),
        body: SafeArea(
            child: Container(
                child: currentSubPage == 'todoView'
                    ? TodoListDetail()
                    : currentIndex == 1 ? TodoList() : TodoSummary())),
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
                return addTodo();
              },
              child: Icon(Icons.add),
            ),
            visible: currentSubPage == '' ? true : false),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

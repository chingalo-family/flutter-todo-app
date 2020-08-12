import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_list/todo_list.dart';
import 'package:todo_app/pages/todo_list_detail/todo_list_detail.dart';
import 'package:todo_app/pages/todo_summary/todo_summary.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/page_model.dart';
import 'package:todo_app/models/todo_model.dart';


class HomePage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final pageSelector = context.watch<PageModel>();
    final todoSelector = context.watch<TodoModel>();

    List<Todo> todoList = todoSelector.todoList;
    int currentIndex = pageSelector.currentIndex;
    String currentSubPage = pageSelector.currentSubPage;
    String currentPageTitle = pageSelector.currentPageTitle;

    void setCurrentPageTitle(String name){
      context.read<PageModel>().setCurrentPageTitle(name);
    }

    void setCurrentSubPage(String name){
      context.read<PageModel>().setCurrentSubPage(name);
    }

    void setCurrentPageTab(int index){
      String name = index == 0 ? 'Todo App - Summary' : index ==1? 'Todo App - List' : 'Todo App';
      setCurrentPageTitle(name);
      context.read<PageModel>().activateTable(index);
    }

    void addTodo(){
      int total = todoList.length;
      String id = '$total';
      String title = 'title $total';
      String description = 'description $total';
      context.read<TodoModel>().addTodo(new Todo(id :id,title:title, description:description));
      setCurrentSubPage('');
      setCurrentPageTitle('Todo App - List');
      setCurrentPageTab(1);
    }

    void onSelectTodo(Todo todo){
        final String pageName = 'todoView';
        context.read<TodoModel>().setCurrentTodo(todo);
        setCurrentSubPage(pageName);
        setCurrentPageTitle(todo.title);
    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(currentPageTitle),
        ),
        body: SafeArea(
            child:Container(
              color: Colors.blue,
                child: currentSubPage == 'todoView'? TodoListDetail(currentTodo: todoSelector.currentTodo,): currentIndex == 1 ? TodoList(todoList: todoList,onSelectTodo: onSelectTodo,) : TodoSummary()
            )
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            return setCurrentPageTab(index);
          },
          backgroundColor: Colors.blue,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black45,
          selectedFontSize: 13.0,
          unselectedFontSize: 12.0,
          iconSize: 20,
          items :[
            BottomNavigationBarItem(icon:Icon(Icons.home),title: Text('Home',style: TextStyle(fontSize: 12.0))),
            BottomNavigationBarItem(icon:Icon(Icons.format_list_numbered),title: Text('Todo',style: TextStyle(fontSize: 12.0)))
          ],
        ),
        floatingActionButton:  Visibility(
          child: FloatingActionButton(
            onPressed: (){
              return addTodo();
            },
            child: Icon(Icons.add),
          ),
          visible: currentSubPage == '' ?true :false
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}


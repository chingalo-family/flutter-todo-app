import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_list/todo_list.dart';
import 'package:todo_app/pages/todo_summary/todo_summary.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _addTodo(){
    print('Modal for todo list');
  }

  void _onTapNavBarIcon(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ),
      ),
      body: SafeArea(
        child:  _currentIndex == 1 ?TodoList() : TodoSummary()
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapNavBarIcon,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items :[
          BottomNavigationBarItem(icon:Icon(Icons.home),title: Text('Home')),
          BottomNavigationBarItem(icon:Icon(Icons.format_list_numbered),title: Text('Todo'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}

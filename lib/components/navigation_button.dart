import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/page_model.dart';


class NavigationButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<PageModel>(context);
    int currentIndex = pageModel.currentIndex;
    void setCurrentPageTab(int index) {
      pageModel.activateTable(index);
    }

    return BottomNavigationBar(
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/page_model.dart';
import 'package:todo_app/core/util_helpers.dart';

class NavigationButton extends StatelessWidget {
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
      selectedFontSize: 18.0,
      unselectedFontSize: 16.0,
      iconSize: 20,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: UtilHelpers.getFontStyles(null, null))),
        BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            title: Text('Todo', style: UtilHelpers.getFontStyles(null, null)))
      ],
    );
  }
}

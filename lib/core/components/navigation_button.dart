import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/page_model.dart';
import 'package:todo_app/core/utils/util_helpers.dart';

class MenuItem {
  String title;
  IconData icon;
  MenuItem({this.icon, this.title});
}

class NavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MenuItem> menus = [
      MenuItem(title: 'Home', icon: Icons.home),
      MenuItem(title: 'Todo', icon: Icons.list),
    ];
    final pageModel = Provider.of<PageModel>(context, listen: false);
    void setCurrentPageTab(int index) {
      pageModel.activateTable(index);
    }

    return SafeArea(
        child: Container(
      color: ThemeData.dark().primaryColor,
      child: Consumer<PageModel>(
        builder: (context, pageState, child) {
          int currentIndex = pageState.currentIndex;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: menus.map((MenuItem menuItem) {
              int index = menus.indexOf(menuItem);
              return GestureDetector(
                onTap: () {
                  return setCurrentPageTab(index);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 9),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                  decoration: BoxDecoration(
                      color: currentIndex == index
                          ? ThemeData.dark().accentColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: SizedBox(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(menuItem.icon),
                          Text(menuItem.title,
                              style: UtilHelpers.getFontStyles(
                                  19,
                                  index == currentIndex
                                      ? ThemeData.dark().primaryColor
                                      : Colors.white))
                        ],
                      )),
                ),
              );
            }).toList(),
          );
        },
      ),
    ));
  }
}

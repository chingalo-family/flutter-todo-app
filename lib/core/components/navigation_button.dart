import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/page_model.dart';
import 'package:todo_app/core/utils/util_helpers.dart';

class NavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> menus = ['Home', 'Todo'];
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
            children: menus.map((String menuItem) {
              int index = menus.indexOf(menuItem);
              return GestureDetector(
                onTap: () {
                  return setCurrentPageTab(index);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                        color: currentIndex == index
                            ? ThemeData.dark().accentColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Text(menuItem,
                        style: UtilHelpers.getFontStyles(
                            19,
                            index == currentIndex
                                ? ThemeData.dark().primaryColor
                                : Colors.white))),
              );
            }).toList(),
          );
        },
      ),
    ));
  }
}

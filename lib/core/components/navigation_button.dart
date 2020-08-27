import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/app_theme_state.dart';
import 'package:todo_app/app-state/page_state.dart';
import 'package:todo_app/core/providers/preference_provider.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/nav_menu_item.dart';

class NavigationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<NavMenuItem> menus = NavMenuItem.getNavMenuItems();
    final pageModel = Provider.of<PageState>(context, listen: false);

    void setCurrentPageTab(int index) {
      pageModel.activateTable(index);
    }

    return SafeArea(child: Consumer<AppThemeState>(
      builder: (context, appThemeState, child) {
        bool isDarkTheme =
            appThemeState.currentTheme == PreferenceProvider.darkTheme;
        return Container(
          color: isDarkTheme
              ? ThemeData.dark().primaryColor
              : ThemeData().accentColor,
          child: Consumer<PageState>(
            builder: (context, pageState, child) {
              int currentIndex = pageState.currentIndex;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: menus.map((NavMenuItem menuItem) {
                  int index = menus.indexOf(menuItem);
                  return InkWell(
                    onTap: () {
                      return setCurrentPageTab(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 9),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                      decoration: BoxDecoration(
                          color: currentIndex == index
                              ? isDarkTheme
                                  ? ThemeData.dark().accentColor
                                  : Colors.white
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
                              Icon(
                                menuItem.icon,
                                size: 18,
                                color: index == currentIndex
                                    ? ThemeData.dark().primaryColor
                                    : Colors.white,
                              ),
                              Text(menuItem.title,
                                  style: UtilHelpers.getFontStyles(
                                      18,
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
        );
      },
    ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/app_theme_state.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/app_pop_up_menu_item.dart';
import 'package:todo_app/pages/about/about.dart';

class AppPopUpMenu extends StatelessWidget {
  final String currentPage;

  const AppPopUpMenu({Key key, this.currentPage = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppThemeState appThemeState =
        Provider.of<AppThemeState>(context, listen: false);
    List<AppPopUpMenuItem> menuItems = AppPopUpMenuItem.getPopUpMenuItems();
    menuItems = menuItems
        .where((AppPopUpMenuItem menuItem) =>
            menuItem.id != appThemeState.currentTheme)
        .toList();
    menuItems = currentPage != ''
        ? menuItems
            .where((AppPopUpMenuItem menuItem) => menuItem.id != currentPage)
            .toList()
        : menuItems;
    return PopupMenuButton(
        onSelected: (AppPopUpMenuItem menuItem) {
          if (menuItem.id == 'about') {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => About(),
            ));
          } else {
            Timer(Duration(milliseconds: 100), () {
              appThemeState.setCurrentTheme(menuItem.id);
            });
          }
        },
        elevation: 4,
        itemBuilder: (BuildContext context) {
          return menuItems
              .map((AppPopUpMenuItem menuItem) => PopupMenuItem(
                  value: menuItem,
                  child: Row(
                    children: [
                      Consumer<AppThemeState>(
                        builder: (context, appThemeState, child) {
                          return Container(
                            child: Icon(
                              menuItem.icon,
                              color: appThemeState.currentTheme == 'dark'
                                  ? ThemeData.dark().accentColor
                                  : ThemeData.light().accentColor,
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 5),
                      Container(
                        child: Text(
                          menuItem.name,
                          style: UtilHelpers.getFontStyles(null, null),
                        ),
                      ),
                    ],
                  )))
              .toList();
        });
  }
}

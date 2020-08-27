import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/app_theme_state.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/app_pop_up_menu_item.dart';

class AppPopUpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeState appThemeState = Provider.of<AppThemeState>(context);
    List<AppPopUpMenuItem> menuItems = AppPopUpMenuItem.getPopUpMenuItems();
    menuItems = menuItems
        .where((AppPopUpMenuItem menuItem) =>
            menuItem.id != appThemeState.currentTheme)
        .toList();

    return PopupMenuButton(
        onSelected: (AppPopUpMenuItem menuItem) {
          appThemeState.setCurrentTheme(menuItem.id);
        },
        elevation: 4,
        itemBuilder: (BuildContext context) {
          return menuItems
              .map((AppPopUpMenuItem menuItem) => PopupMenuItem(
                  value: menuItem,
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          menuItem.name,
                          style: UtilHelpers.getFontStyles(null, null),
                        ),
                      ),
                      Container(),
                    ],
                  )))
              .toList();
        });
  }
}

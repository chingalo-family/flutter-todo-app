import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/page_state.dart';
import 'package:todo_app/core/components/app_pop_up_menu.dart';
import 'package:todo_app/core/components/button_floating_action.dart';
import 'package:todo_app/core/components/navigation_button.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/app_pop_up_menu_item.dart';
import 'package:todo_app/pages/todo_list/todo_list.dart';
import 'package:todo_app/pages/todo_summary/todo_summary.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageState>(
      builder: (context, pageState, child) {
        String currentPageTitle = pageState.currentPageTitle;
        int currentIndex = pageState.currentIndex;
        return Scaffold(
            appBar: AppBar(
              title: Text(currentPageTitle,
                  style: UtilHelpers.getFontStyles(25.0, null)),
              actions: [AppPopUpMenu()],
            ),
            body: SafeArea(
                child: Container(
                    child: currentIndex == 1 ? TodoList() : TodoSummary())),
            bottomNavigationBar: NavigationButton(),
            floatingActionButton: ButtonFloatingAction(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked);
      },
    );
  }
}

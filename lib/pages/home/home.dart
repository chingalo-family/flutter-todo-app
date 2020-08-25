import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app-state/page_model.dart';
import 'package:todo_app/core/utils/components/button_floating_action.dart';
import 'package:todo_app/core/utils/components/navigation_button.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/pages/todo_list/todo_list.dart';
import 'package:todo_app/pages/todo_summary/todo_summary.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<PageModel>(context);

    int currentIndex = pageModel.currentIndex;
    String currentPageTitle = pageModel.currentPageTitle;

    return Scaffold(
        appBar: AppBar(
            title: Text(currentPageTitle,
                style: UtilHelpers.getFontStyles(25.0, null))),
        body: SafeArea(
            child: Container(
                child: currentIndex == 1 ? TodoList() : TodoSummary())),
        bottomNavigationBar: NavigationButton(),
        floatingActionButton: ButtonFloatingAction(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

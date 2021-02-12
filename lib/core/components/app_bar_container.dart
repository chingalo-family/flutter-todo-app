import 'package:flutter/material.dart';
import 'package:todo_app/core/components/app_pop_up_menu.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key key,
    this.isAboutPage,
    this.isViewChartVisible,
    this.isAddTodoVisible,
    this.elevation = 0.0,
    @required this.title,
    this.onAdd,
    this.onOpenChart,
  }) : super(key: key);

  final String title;
  final bool isAboutPage;
  final bool isViewChartVisible;
  final bool isAddTodoVisible;
  final double elevation;

  final VoidCallback onOpenChart;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      title: Text(
        title,
        style: TextStyle().copyWith(
          fontSize: 16.0,
        ),
      ),
      actions: [
        Visibility(
          visible: isViewChartVisible,
          child: IconButton(
            icon: Icon(
              Icons.bar_chart,
            ),
            onPressed: onOpenChart,
          ),
        ),
        Visibility(
          visible: isAddTodoVisible,
          child: IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: onAdd,
          ),
        ),
        Container(
          child: AppPopUpMenu(
            currentPage: isAboutPage ? 'about' : '',
          ),
        ),
      ],
    );
  }
}

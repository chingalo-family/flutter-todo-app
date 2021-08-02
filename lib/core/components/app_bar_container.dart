import 'package:flutter/material.dart';
import 'package:todo_app/core/components/app_pop_up_menu.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key? key,
    this.isAboutPage,
    this.isViewChartVisible,
    this.isAddVisible,
    this.elevation = 0.0,
    required this.title,
    this.onAdd,
    this.onOpenChart,
    this.isEditVisible = false,
    this.isDeleteVisible = false,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  final String title;
  final bool? isAboutPage;
  final bool? isViewChartVisible;
  final bool? isAddVisible;
  final bool isEditVisible;
  final bool isDeleteVisible;
  final double elevation;

  final VoidCallback? onOpenChart;
  final VoidCallback? onAdd;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

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
          visible: isViewChartVisible ?? false,
          child: IconButton(
            icon: Icon(
              Icons.bar_chart,
            ),
            onPressed: onOpenChart,
          ),
        ),
        Visibility(
          visible: isAddVisible ?? false,
          child: IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: onAdd,
          ),
        ),
        Visibility(
          visible: isEditVisible,
          child: IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: onEdit,
          ),
        ),
        Visibility(
          visible: isDeleteVisible,
          child: IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: onDelete,
          ),
        ),
        Container(
          child: AppPopUpMenu(
            currentPage: isAboutPage == true ? 'about' : '',
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/pages/todo_summary/components/todo-summary-chart.dart';

class TodoSummary extends StatelessWidget {
  TodoSummary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: UtilHelpers.getRamdomCalor(), width: 5))),
                child: ListTile(
                  title: Text(
                    'Summary total',
                    style: UtilHelpers.getFontStyles(20.0, null),
                  ),
                  subtitle: Text('Summary total to come',
                      style: UtilHelpers.getFontStyles(18.0, null)),
                ),
              ),
            ),
            TodoSummaryChart(),
          ],
        ),
      ),
    );
  }
}

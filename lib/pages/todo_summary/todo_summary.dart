import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_summary/components/todo_summary_chart.dart';
import 'package:todo_app/pages/todo_summary/components/todo_summary_total.dart';

class TodoSummary extends StatelessWidget {
  TodoSummary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TodoSummaryTotal(),
            TodoSummaryChart(),
          ],
        ),
      ),
    );
  }
}

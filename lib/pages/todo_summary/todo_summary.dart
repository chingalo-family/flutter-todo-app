import 'package:flutter/material.dart';

class TodoSummary extends StatefulWidget {
  TodoSummary({
    Key key,
  }) : super(key: key);

  @override
  _TodoSummaryPageState createState() => _TodoSummaryPageState();
}

class _TodoSummaryPageState extends State<TodoSummary> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Todo Summary',
    );
  }
}

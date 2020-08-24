import 'package:flutter/material.dart';
import 'package:todo_app/core/util_helpers.dart';

class TodoSummary extends StatelessWidget {
  TodoSummary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Card(
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
          Container(
            child: Card(
              child: ListTile(
                title: Text('Summary Chart',
                    style: UtilHelpers.getFontStyles(20.0, null)),
                subtitle: Text('Chart to come',
                    style: UtilHelpers.getFontStyles(18.0, null)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

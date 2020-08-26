import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo.dart';

class TodoTaskContainer extends StatelessWidget {
  const TodoTaskContainer({Key key, @required TodoTask todoTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: ThemeData.dark().accentColor))),
      child: ListTile(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => {},
              child: Icon(Icons.edit),
            ),
            GestureDetector(
              onTap: () => {},
              child: Icon(Icons.delete),
            )
          ],
        ),
        title:
            Text('Summary Chart', style: UtilHelpers.getFontStyles(18, null)),
        subtitle:
            Text('Chart to come', style: UtilHelpers.getFontStyles(15, null)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Todo List'),
      actions: [
        Container(child: Text("Chart")),
        Container(child: Text("Add")),
        Container(child: Text("More")),
      ],
    );
  }
}

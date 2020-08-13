import 'package:flutter/material.dart';

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
                title: Text('Summary total'),
                subtitle: Text('Summary total to come'),
              ),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                title: Text('Summary Chart'),
                subtitle: Text('Chart to come'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

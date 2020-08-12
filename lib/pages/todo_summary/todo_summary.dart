import 'package:flutter/material.dart';

class TodoSummary extends StatelessWidget {
  TodoSummary({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(10),
      height: height,
        width: width,
      child: Text('')
    );
  }
}

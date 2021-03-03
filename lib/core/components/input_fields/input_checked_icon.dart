import 'package:flutter/material.dart';

class InputCheckedIcon extends StatelessWidget {
  const InputCheckedIcon({Key key, @required this.showTickedIcon, this.color})
      : super(key: key);

  final bool showTickedIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !showTickedIcon
          ? Container()
          : Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.done,
                color: color ?? Colors.black,
              ),
            ),
    );
  }
}

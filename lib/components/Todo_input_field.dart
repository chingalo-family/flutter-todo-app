import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_field.dart';

class TodoInputField extends StatelessWidget {

  TodoInputField({this.inputField, this.onInputValueChange});

  final TodoField inputField;
  final Function  onInputValueChange;
  final TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
        child: Column(
          children: <Widget>[
            TextField(
                onChanged: onInputValueChange,
                controller: textController,
                readOnly: false,
                decoration: InputDecoration(
                  labelText: this.inputField.label,
                ))
          ],
        ),
      ),
    );
  }
}

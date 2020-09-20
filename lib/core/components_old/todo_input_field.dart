import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo_field.dart';

class TodoInputField extends StatelessWidget {
  TodoInputField({this.inputField, this.onInputValueChange, this.initialValue});

  final TodoField inputField;
  final String initialValue;

  final Function onInputValueChange;

  @override
  Widget build(BuildContext context) {
    TextEditingController textController =
        new TextEditingController(text: initialValue);

    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
        child: Column(
          children: <Widget>[
            TextFormField(
                obscureText: false,
                keyboardType: TextInputType.text,
                onChanged: onInputValueChange,
                maxLines: inputField.inputType == 'LONG_TEXT' ? null : 1,
                controller: textController,
                style: UtilHelpers.getFontStyles(14.0, null),
                readOnly: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: this.inputField.label,
                  errorText: null,
                ))
          ],
        ),
      ),
    );
  }
}

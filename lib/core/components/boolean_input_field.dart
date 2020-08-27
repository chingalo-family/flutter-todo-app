import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/util_helpers.dart';
import 'package:todo_app/models/todo_field.dart';

class BooleanInputField extends StatefulWidget {
  const BooleanInputField(
      {Key key,
      @required this.inputField,
      @required this.initialValue,
      @required this.onInputValueChange})
      : super(key: key);

  final TodoField inputField;
  final String initialValue;

  final Function onInputValueChange;

  @override
  _BooleanInputFieldState createState() => _BooleanInputFieldState();
}

class _BooleanInputFieldState extends State<BooleanInputField> {
  bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue == 'true';
  }

  void setSelectedOption(bool value) {
    setState(() {
      _currentValue = value;
    });
    widget.onInputValueChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.inputField.label,
                  style: UtilHelpers.getFontStyles(null, null),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: _currentValue,
                          onChanged: setSelectedOption),
                      Text('No')
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                          value: true,
                          groupValue: _currentValue,
                          onChanged: setSelectedOption),
                      Text('Yes')
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

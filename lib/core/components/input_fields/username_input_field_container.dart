import 'package:flutter/material.dart';
import 'package:todo_app/core/components/input_fields/input_checked_icon.dart';
import 'package:todo_app/models/input_field.dart';

class UsernameInputFieldContainer extends StatefulWidget {
  const UsernameInputFieldContainer({
    Key key,
    @required this.inputField,
    this.onInputValueChange,
    this.inputValue,
  }) : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final String inputValue;

  @override
  _UsernameInputFieldContainerState createState() =>
      _UsernameInputFieldContainerState();
}

class _UsernameInputFieldContainerState
    extends State<UsernameInputFieldContainer> {
  TextEditingController usernameController;
  String _value;

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.inputValue;
    });
    this.usernameController = TextEditingController(text: widget.inputValue);
  }

  onValueChange(String value) {
    setState(() {
      _value = value;
    });
    widget.onInputValueChange(value.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: widget.inputField.isReadObly,
              controller: widget.inputField.isReadObly
                  ? TextEditingController(text: widget.inputValue)
                  : usernameController,
              onChanged: onValueChange,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: TextStyle().copyWith(
                color: widget.inputField.inputColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                errorText: null,
              ),
            ),
          ),
          InputCheckedIcon(
            showTickedIcon: _value != null && '$_value'.trim() != '',
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}

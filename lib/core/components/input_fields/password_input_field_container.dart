import 'package:flutter/material.dart';
import 'package:todo_app/core/components/input_fields/input_checked_icon.dart';
import 'package:todo_app/models/input_field.dart';

class PasswordInputFieldContainer extends StatefulWidget {
  const PasswordInputFieldContainer({
    Key key,
    @required this.inputField,
    this.onInputValueChange,
    this.inputValue,
  }) : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;
  final String inputValue;

  @override
  _PasswordInputFieldContainerState createState() =>
      _PasswordInputFieldContainerState();
}

class _PasswordInputFieldContainerState
    extends State<PasswordInputFieldContainer> {
  TextEditingController passwordController;
  String _value;

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.inputValue;
    });
    this.passwordController = TextEditingController(text: widget.inputValue);
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
                  : passwordController,
              onChanged: onValueChange,
              obscureText: true,
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

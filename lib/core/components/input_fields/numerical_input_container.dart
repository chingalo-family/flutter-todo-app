import 'package:flutter/material.dart';
import 'package:todo_app/core/components/input_fields/input_checked_icon.dart';
import 'package:todo_app/models/input_field.dart';

class NumericalInputFieldContainer extends StatefulWidget {
  const NumericalInputFieldContainer({
    Key? key,
    required this.inputField,
    required this.onInputValueChange,
    this.inputValue,
  }) : super(key: key);

  final InputField inputField;
  final Function? onInputValueChange;
  final String? inputValue;

  @override
  _NumericalInputFieldContainerState createState() =>
      _NumericalInputFieldContainerState();
}

class _NumericalInputFieldContainerState
    extends State<NumericalInputFieldContainer> {
  TextEditingController? numericalController;
  String? _value;

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.inputValue;
    });
    numericalController = TextEditingController(text: widget.inputValue);
  }

  void onValueChange(String value) {
    // @TODO handling error messages
    setState(() {
      _value = value;
    });

    widget.onInputValueChange!(value.trim());
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
                  ? TextEditingController(
                      text: widget.inputValue,
                    )
                  : numericalController,
              keyboardType: TextInputType.number,
              onChanged: onValueChange,
              style: TextStyle().copyWith(
                color: widget.inputField.inputColor,
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: InputBorder.none,
                errorText: null,
              ),
            ),
          ),
          InputCheckedIcon(
            showTickedIcon: '$_value'.trim() != '',
            color: widget.inputField.inputColor,
          )
        ],
      ),
    );
  }
}

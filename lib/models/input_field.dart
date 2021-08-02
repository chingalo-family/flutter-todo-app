import 'package:flutter/material.dart';
import 'package:todo_app/models/input_field_option.dart';

class InputField {
  String id;
  String name;
  String description;
  String valueType;
  Color labelColor;
  Color inputColor;
  Color background;
  bool renderAsRadio;
  bool isReadObly;
  bool allowFuturePeriod;
  List<InputFieldOption> options;
  bool hasSubInputField;
  InputField? subInputField;
  List<int> allowedSelectedLevels;

  InputField({
    required this.id,
    required this.name,
    required this.valueType,
    this.hasSubInputField = false,
    this.description = "",
    this.inputColor = Colors.blueGrey,
    this.labelColor = Colors.blueGrey,
    this.background = Colors.transparent,
    this.renderAsRadio = false,
    this.isReadObly = false,
    this.options = const [],
    this.subInputField,
    this.allowedSelectedLevels = const [],
    this.allowFuturePeriod = false,
  });

  @override
  String toString() {
    return '$id - $name - $isReadObly';
  }
}

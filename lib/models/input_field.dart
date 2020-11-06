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
  InputField subInputField;
  List<int> allowedSelectedLevels;

  InputField({
    @required this.id,
    @required this.name,
    @required this.valueType,
    this.hasSubInputField,
    this.description,
    this.inputColor,
    this.labelColor,
    this.background,
    this.renderAsRadio,
    this.isReadObly,
    this.options,
    this.subInputField,
    this.allowedSelectedLevels,
    this.allowFuturePeriod,
  }) {
    this.allowedSelectedLevels = this.allowedSelectedLevels ?? [];
    this.allowFuturePeriod = this.allowFuturePeriod ?? false;
    this.isReadObly = this.isReadObly ?? false;
    this.description = this.description ?? '';
    this.hasSubInputField = this.hasSubInputField ?? false;
    this.renderAsRadio = this.renderAsRadio ?? false;
    this.options = this.options ?? [];
    this.inputColor = this.inputColor ?? Colors.black;
    this.labelColor = this.labelColor ?? Color(0xFF1A3518);
    this.background = this.background ?? Colors.transparent;
  }

  @override
  String toString() {
    return '$id - $name - $isReadObly';
  }
}

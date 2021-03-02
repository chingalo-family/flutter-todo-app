import 'package:flutter/material.dart';
import 'package:todo_app/models/form_section.dart';
import 'package:todo_app/models/input_field.dart';

class TodoForm {
  static List<FormSection> getFormSections(Color textColor) {
    return [
      FormSection(
        name: "",
        color: textColor,
        inputFields: [
          InputField(
            id: 'title',
            name: "Title",
            valueType: 'TEXT',
            inputColor: textColor,
            labelColor: textColor,
          ),
          InputField(
            id: 'description',
            name: "Desctiption",
            valueType: 'TEXT',
            inputColor: textColor,
            labelColor: textColor,
          ),
        ],
      ),
    ];
  }
}

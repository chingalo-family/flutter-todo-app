import 'package:flutter/material.dart';
import 'package:todo_app/core/components/entry_forms/entry_form_container.dart';
import 'package:todo_app/models/form_section.dart';

class TodoFormContainer extends StatelessWidget {
  const TodoFormContainer({
    Key key,
    @required this.todoFormSections,
  }) : super(key: key);

  final List<FormSection> todoFormSections;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: EntryFormContainer(
              elevation: 0.0,
              isEditableMode: false,
              formSections: todoFormSections,
              dataObject: Map(),
              mandatoryFieldObject: Map(),
            ),
          ),
          Container(
            child: Text("form btn"),
          ),
        ],
      ),
    );
  }
}

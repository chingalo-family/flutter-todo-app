import 'package:flutter/material.dart';
import 'package:todo_app/core/components/input_fields/input_field_container.dart';
import 'package:todo_app/models/form_section.dart';
import 'package:todo_app/models/input_field.dart';

class EntrySubFormContainer extends StatelessWidget {
  const EntrySubFormContainer({
    Key? key,
    required this.subSections,
    required this.dataObject,
    required this.mandatoryFieldObject,
    this.isEditableMode = true,
    this.onInputValueChange,
    this.hiddenFields,
    this.hiddenSections,
  }) : super(key: key);

  final List<FormSection> subSections;
  final Function? onInputValueChange;
  final Map dataObject;
  final Map mandatoryFieldObject;
  final Map? hiddenFields;
  final Map? hiddenSections;
  final bool isEditableMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: subSections
            .map(
              (FormSection subSection) => Visibility(
                visible: hiddenSections == null ||
                    '${hiddenSections![subSection.id]}'.trim() != 'true',
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: subSection.name != '' ? 5.0 : 0.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: subSection.borderColor!,
                        width: 8.0,
                      ),
                    ),
                    color: subSection.backgroundColor,
                  ),
                  child: Column(
                    children: [
                      Visibility(
                        visible: subSection.name != '',
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  subSection.name,
                                  style: TextStyle().copyWith(
                                    color: subSection.color,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: subSection.description != '',
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  subSection.description!,
                                  style: TextStyle().copyWith(
                                    color: subSection.color,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: subSection.inputFields!
                              .map(
                                (InputField inputField) => Visibility(
                                  visible: '${hiddenFields![inputField.id]}'
                                          .trim() !=
                                      'true',
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 10.0,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: inputField.background ==
                                              Colors.transparent
                                          ? 10.0
                                          : 0.0,
                                    ),
                                    child: InputFieldContainer(
                                      inputField: inputField,
                                      isEditableMode: isEditableMode,
                                      mandatoryFieldObject:
                                          mandatoryFieldObject,
                                      dataObject: dataObject,
                                      onInputValueChange: (
                                        String id,
                                        dynamic value,
                                      ) =>
                                          onInputValueChange!(id, value),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Container(
                        child: EntrySubFormContainer(
                          hiddenFields: hiddenSections,
                          subSections: subSection.subSections!,
                          dataObject: dataObject,
                          mandatoryFieldObject: mandatoryFieldObject,
                          onInputValueChange: onInputValueChange,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

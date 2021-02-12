import 'package:flutter/material.dart';
import 'package:todo_app/core/components/input_fields/true_only_input_field_container.dart';
import 'package:todo_app/core/components/material_card.dart';
import 'package:todo_app/models/input_field.dart';
import 'package:todo_app/models/todo_task.dart';

class TodoTaskCard extends StatelessWidget {
  const TodoTaskCard({
    Key key,
    @required this.textColor,
    @required this.todoTask,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  final Color textColor;
  final TodoTask todoTask;

  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialCard(
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
          child: Row(
            children: [
              Container(
                child: TrueOnlyInputFieldContainer(
                  inputField: InputField(
                    id: todoTask.id,
                    name: todoTask.title,
                    valueType: "TRUE_ONLY",
                  ),
                  inputValue: todoTask.isCompleted,
                  onInputValueChange: (dynamic value) => {print(value)},
                ),
              ),
              Expanded(
                child: Text(
                  todoTask.title,
                  style: TextStyle().copyWith(
                    fontSize: 14.0,
                    color: textColor,
                  ),
                ),
              ),
              Container(
                child: Text('icon'),
              ),
              Container(
                child: Text('icon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

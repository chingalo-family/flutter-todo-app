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
    this.onUpdateTodoTaskStatus,
  }) : super(key: key);

  final Color textColor;
  final TodoTask todoTask;

  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final Function onUpdateTodoTaskStatus;

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
                  onInputValueChange: (dynamic value) =>
                      onUpdateTodoTaskStatus(value != ""),
                ),
              ),
              Expanded(
                child: Text(
                  todoTask.title,
                  style: TextStyle().copyWith(
                    decoration: todoTask.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                    fontSize: 14.0,
                    color: textColor,
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  child: _buildIcon(
                    Icons.edit,
                    textColor,
                  ),
                  onTap: onEdit,
                ),
              ),
              Container(
                child: InkWell(
                  child: _buildIcon(
                    Icons.delete,
                    textColor,
                  ),
                  onTap: onDelete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Icon(
        icon,
        color: color.withOpacity(0.6),
        size: 20,
      ),
    );
  }
}

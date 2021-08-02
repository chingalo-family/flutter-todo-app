import 'package:flutter/material.dart';
import 'package:todo_app/core/components/input_fields/true_only_input_field_container.dart';
import 'package:todo_app/core/components/material_card.dart';
import 'package:todo_app/models/input_field.dart';
import 'package:todo_app/models/todo_task.dart';

class TodoTaskCard extends StatefulWidget {
  const TodoTaskCard({
    Key? key,
    required this.textColor,
    required this.todoTask,
    this.onDelete,
    this.onEdit,
    this.onUpdateTodoTaskStatus,
  }) : super(key: key);

  final Color textColor;
  final TodoTask todoTask;

  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final Function? onUpdateTodoTaskStatus;

  @override
  _TodoTaskCardState createState() => _TodoTaskCardState();
}

class _TodoTaskCardState extends State<TodoTaskCard> {
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    onUpdateTodoTaskStatus(widget.todoTask.isCompleted);
  }

  @override
  void didUpdateWidget(covariant TodoTaskCard oldWidget) {
    super.didUpdateWidget(widget);
    if (oldWidget.todoTask.isCompleted != widget.todoTask.isCompleted)
      onUpdateTodoTaskStatus(widget.todoTask.isCompleted);
  }

  onUpdateTodoTaskStatus(bool isCompleted) {
    _isCompleted = isCompleted;
    widget.onUpdateTodoTaskStatus!(isCompleted);
    setState(() {});
  }

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
                    id: widget.todoTask.id,
                    name: widget.todoTask.title,
                    valueType: "TRUE_ONLY",
                  ),
                  inputValue: _isCompleted,
                  onInputValueChange: (dynamic value) =>
                      onUpdateTodoTaskStatus(value != ""),
                ),
              ),
              Expanded(
                child: Text(
                  widget.todoTask.title,
                  style: TextStyle().copyWith(
                    decoration: widget.todoTask.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                    fontSize: 14.0,
                    color: widget.textColor,
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  child: _buildIcon(
                    Icons.edit,
                    widget.textColor,
                  ),
                  onTap: widget.onEdit,
                ),
              ),
              Container(
                child: InkWell(
                  child: _buildIcon(
                    Icons.delete,
                    widget.textColor,
                  ),
                  onTap: widget.onDelete,
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

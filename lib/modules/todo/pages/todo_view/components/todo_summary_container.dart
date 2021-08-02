import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/core/components/material_card.dart';
import 'package:todo_app/models/todo.dart';

class TodoSummaryContainer extends StatelessWidget {
  const TodoSummaryContainer({
    Key? key,
    required this.textColor,
    required this.currentTodo,
    this.onTapCurrentTodo,
  }) : super(key: key);

  final Color textColor;
  final Todo currentTodo;
  final VoidCallback? onTapCurrentTodo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCurrentTodo,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: MaterialCard(
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 3.0,
                          ),
                          child: Text(
                            currentTodo.title,
                            style: TextStyle().copyWith(
                              fontSize: 20.0,
                              color: textColor,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentTodo.description != "",
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 3.0,
                            ),
                            child: Text(
                              currentTodo.description,
                              style: TextStyle().copyWith(
                                color: textColor,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 3.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Status : ${currentTodo.isCompleted ? 'Completed' : 'Not completed'}',
                                  style: TextStyle().copyWith(
                                    color: currentTodo.isCompleted
                                        ? Color(0xFF34C759)
                                        : Colors.redAccent,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${currentTodo.completedTasks}/${currentTodo.tasks.length} tasks',
                                  style: TextStyle().copyWith(
                                    color: currentTodo.isCompleted
                                        ? Color(0xFF34C759)
                                        : Colors.redAccent,
                                    fontSize: 12.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

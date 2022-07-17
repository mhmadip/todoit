import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/task.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = false;
  final String? taskTitle;
  final void Function(bool? a) checkboxCallback;
  final void Function() longPressCallback;

  TaskTile({
    required this.isChecked,
    this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
          hoverColor: Colors.greenAccent,
          onLongPress: longPressCallback,
          title: Text(
            '$taskTitle',
            style: TextStyle(
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          trailing: Checkbox(
              activeColor: Colors.lightBlueAccent,
              value: isChecked,
              onChanged: checkboxCallback)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoit/widgets/task_tile.dart';
import 'package:todoit/model/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (
            context,
            index,
          ) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isChecked,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () => taskData.deleteTask(task),
            );
          }),
    );
  }
}

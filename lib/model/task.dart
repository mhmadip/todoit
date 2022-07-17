import 'dart:collection';
import 'package:flutter/material.dart';

class Task extends ChangeNotifier {
  String? name;
  bool isChecked;

  Task({this.isChecked = false, this.name});

  void toggleDone() {
    isChecked = !isChecked;
  }
}

// Provider data class
class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'study'),
    Task(name: 'calls'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskTitle) {
    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

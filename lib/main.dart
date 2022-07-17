import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoit/screens/tasks_screen.dart';
import 'model/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return TaskData();
      },
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

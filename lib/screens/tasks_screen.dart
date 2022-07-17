import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoit/widgets/tasks_list.dart';
import 'package:todoit/screens/add_tasks_screen.dart';
import '../model/task.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Task>(
      create: (context) {
        return Task();
      },
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Color(0xff757575),
                context: context,
                builder: (context) =>
                    SingleChildScrollView(child: AddTaskScreen()));
          },
          child: const Icon(Icons.add_task_rounded),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        color: Colors.deepPurpleAccent,
                        size: 30.0,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'To Do it app!',
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 2000),
                      ),
                    ],
                    totalRepeatCount: 3,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

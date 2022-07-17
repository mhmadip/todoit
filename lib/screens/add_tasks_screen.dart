import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: const EdgeInsets.all(50.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 30.0),
          ),
          TextField(
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.task,
                  color: Colors.deepPurpleAccent,
                ),
                hintText: "Enter your task",
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTask) {
                newTaskTitle = newTask;
              }),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.deepPurpleAccent)),
            onPressed: () async {
              if (newTaskTitle != null) {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!);
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

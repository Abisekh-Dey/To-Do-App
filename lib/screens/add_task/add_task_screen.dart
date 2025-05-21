import 'package:flutter/material.dart';
import 'add_task_screen_body.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        backgroundColor: Colors.red[100],
      ),
      body: const AddTaskScreenBody(),
    );
  }
}

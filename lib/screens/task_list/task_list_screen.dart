import 'package:flutter/material.dart';
import 'task_list_screen_body.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Tasks'),
        backgroundColor: Colors.orange[200],
      ),
      body: const TaskListScreenBody(),
    );
  }
}

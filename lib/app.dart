import 'package:flutter/material.dart';
import 'screens/task_list/task_list_screen.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Tasks',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF1F3F6),
        ),
      ),
      home: const TaskListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

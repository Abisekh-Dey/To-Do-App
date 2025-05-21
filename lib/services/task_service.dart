import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskService {
  static const String _taskKey = 'tasks';

  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList(_taskKey) ?? [];
    return taskList.map((jsonTask) => Task.fromJson(json.decode(jsonTask))).toList();
  }

  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonTasks = tasks.map((task) => json.encode(task.toJson())).toList();
    await prefs.setStringList(_taskKey, jsonTasks);
  }
}

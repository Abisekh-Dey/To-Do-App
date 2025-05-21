import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskListController extends ChangeNotifier {
  List<Task> tasks = [];

  Future<void> loadTasks() async {
    tasks = await TaskService.loadTasks();
    notifyListeners();
  }

  Future<void> toggleTask(int index) async {
    tasks[index].isDone = !tasks[index].isDone;
    await TaskService.saveTasks(tasks);
    notifyListeners();
  }

  Future<void> deleteTask(int index) async {
    tasks.removeAt(index);
    await TaskService.saveTasks(tasks);
    notifyListeners();
  }

  Future<void> addTask(Task newTask) async {
    tasks.add(newTask);
    await TaskService.saveTasks(tasks);
    notifyListeners();
  }
}

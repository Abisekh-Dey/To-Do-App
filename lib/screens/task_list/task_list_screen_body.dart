import 'package:flutter/material.dart';
import '../../controllers/task_list_controller.dart';
import '../../models/task.dart';
import '../../widgets/task_tile.dart';
import '../add_task/add_task_screen.dart';

class TaskListScreenBody extends StatefulWidget {
  const TaskListScreenBody({super.key});

  @override
  State<TaskListScreenBody> createState() => _TaskListScreenBodyState();
}

class _TaskListScreenBodyState extends State<TaskListScreenBody> {
  final controller = TaskListController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
    controller.loadTasks();
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    super.dispose();
  }

  Future<void> _navigateToAddTask() async {
    final newTask = await Navigator.push<Task>(
      context,
      MaterialPageRoute(builder: (_) => const AddTaskScreen()),
    );
    if (newTask != null) {
      await controller.addTask(newTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        controller.tasks.isEmpty
            ? const Center(child: Text("No tasks yet. Tap '+' to add one!"))
            : ListView.builder(
              itemCount: controller.tasks.length,
              itemBuilder:
                  (ctx, index) => TaskTile(
                    task: controller.tasks[index],
                    onToggle: () => controller.toggleTask(index),
                    onDelete: () => controller.deleteTask(index),
                  ),
            ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: _navigateToAddTask,
            backgroundColor: Colors.orange[300],
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../controllers/add_task_controller.dart';
import '../../widgets/custom_text_field.dart';

class AddTaskScreenBody extends StatefulWidget {
  const AddTaskScreenBody({super.key});

  @override
  State<AddTaskScreenBody> createState() => _AddTaskScreenBodyState();
}

class _AddTaskScreenBodyState extends State<AddTaskScreenBody> {
  final controller = AddTaskController();

  void _saveTask() {
    if (controller.validate()) {
      final task = controller.createTask();
      Navigator.pop(context, task);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: controller.titleController,
              label: 'Task Title',
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Title is required'
                          : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: controller.descController,
              label: 'Task Description',
              validator: (_) => null,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}

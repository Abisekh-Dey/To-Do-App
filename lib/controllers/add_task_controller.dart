import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  Task createTask() {
    return Task(title: titleController.text, description: descController.text);
  }

  void dispose() {
    titleController.dispose();
    descController.dispose();
  }
}

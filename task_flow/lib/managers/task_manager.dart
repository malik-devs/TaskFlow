import 'dart:convert';
import 'dart:io';

import 'package:task_flow/exceptions/task_not_found_exception.dart';
import 'package:task_flow/models/task.dart';
import 'package:task_flow/enums/status.dart';

class TaskManager {
  final List<Task> _tasks = [];
  int get taskCount => _tasks.length;
  List<Task> get taskList => List.unmodifiable(_tasks);
  int _nextId = 1;

  void addTask(String taskTitle) {
    _tasks.add(Task(_nextId, taskTitle));
    _nextId++;
  }

  void showTasks() {
    for (var task in _tasks) {
      final date = task.createdAt;

      print("[${task.id}] ${task.title}");
      print("    Status: ${task.status.name}");
      print(
        "    Created: "
        "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year} "
        "${date.hour.toString().padLeft(2, '0')}:"
        "${date.minute.toString().padLeft(2, '0')}",
      );
      print("");
    }
  }

  void completeTask(int id) {
    try {
      _tasks
          .firstWhere(
            (task) => task.id == id,
            orElse: () => throw TaskNotFoundException(id),
          )
          .complete();
    } on TaskNotFoundException catch (e) {
      print(e);
    }
  }

  void deleteTask(int id) {
    try {
      Task task = _tasks.firstWhere(
        (task) => task.id == id,
        orElse: () => throw TaskNotFoundException(id),
      );
      _tasks.remove(task);
    } on TaskNotFoundException catch (e) {
      print(e);
    }
  }

  List<Task> searchTasks(String keyword) {
    keyword = keyword.toLowerCase();
    return _tasks
        .where((task) => task.title.toLowerCase().contains(keyword))
        .toList();
  }

  List<Task> filterTasks(Status status) {
    return _tasks.where((task) => task.status == status).toList();
  }

  void sortAZ() {
    _tasks.sort((a, b) => a.title.compareTo(b.title));
  }

  void sortZA() {
    _tasks.sort((a, b) => b.title.compareTo(a.title));
  }

  Future<void> saveTasks() async {
    final taskData = _tasks.map((task) => task.toJson()).toList();
    final jsonString = jsonEncode(taskData);

    final file = File("tasks.json");
    await file.writeAsString(jsonString);
  }

  Future<void> loadTasks() async {
    final file = File("tasks.json");

    if (!await file.exists()) {
      return;
    }

    final jsonString = await file.readAsString();

    final List<dynamic> taskData = jsonDecode(jsonString);

    _tasks.clear();

    _tasks.addAll(taskData.map((data) => Task.fromJson(data)).toList());

    if (_tasks.isNotEmpty) {
      _nextId =
          _tasks.map((task) => task.id).reduce((a, b) => a > b ? a : b) + 1;
    }
  }
}

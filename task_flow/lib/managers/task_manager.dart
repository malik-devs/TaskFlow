import 'package:task_flow/models/task.dart';

class TaskManager {
  final List<Task> _tasks = [];
  int get taskCount => _tasks.length;
  List<Task> get taskList => List.unmodifiable(_tasks);

  void addTask(String taskTitle) {
    _tasks.add(Task(taskTitle));
  }

  void showTasks() {
    int c = 0;
    for (var task in _tasks) {
      print("$c. ${task.title}   ${task.status}");
      c++;
    }
    print("");
  }

  void completeTask(int index) {
    if (checkIndex(index)) _tasks[index].complete();
  }

  void deleteTask(int index) {
    if (checkIndex(index)) _tasks.removeAt(index);
  }

  bool checkIndex(int index) {
    return index >= 0 && index < _tasks.length;
  }

  List<Task> searchTasks(String keyword) {
    keyword = keyword.toLowerCase();
    return _tasks
        .where(
          (task) => task.title.toLowerCase().contains(keyword),
        )
        .toList();
  }
}

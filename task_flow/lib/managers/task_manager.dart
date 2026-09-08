import 'package:task_flow/models/task.dart';


class TaskManager {
  final List<Task> _tasks = [];

  void addTask(String taskTitle) {
    _tasks.add(Task(taskTitle));
  }

  int get taskCount => _tasks.length;

  void showTasks() {
    int c = 0;
    for (var task in _tasks) {
      print("$c. ${task.title}   ${task.status}");
      c++;
    }
    print("");
  }

  void completeTask(int index) {
    _tasks[index].complete();  
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}

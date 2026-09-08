import 'package:task_flow/managers/task_manager.dart';


void main() {
  print("===== TaskFlow =====");
  TaskManager taskManager = TaskManager();
  taskManager.addTask("Learn Dart");
  taskManager.addTask("Learn Flutter");

  print(taskManager.taskCount);
  taskManager.showTasks();

  taskManager.completeTask(0);
  taskManager.showTasks();

  
}

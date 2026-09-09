import 'dart:io';
import 'package:task_flow/managers/task_manager.dart';

void main() {
  bool flag = true;
  TaskManager taskManager = TaskManager();
  do {
    print("===== TaskFlow =====");
    print("1. Add Task");
    print("2. Show Tasks");
    print("3. Complete Task");
    print("4. Delete Task");
    print("5. Exit");
    stdout.write("Choose an option: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        addTaskMenu(taskManager);
        break;
      case 2:
        taskManager.showTasks();
        waitToPress();
        break;
      case 3:
        completeTaskMenu(taskManager);
        break;
      case 4:
        deleteTaskMenu(taskManager);
        break;
      case 5:
        flag = false;
        break;
    }
  } while (flag);
}

void waitToPress() {
  print("Press Enter to continue");
  stdin.readLineSync();
}

void addTaskMenu(TaskManager taskManager) {
  print("Enter Title of Task...");
  String title = stdin.readLineSync()!;
  taskManager.addTask(title);
}

void deleteTaskMenu(TaskManager taskManager) {
  print("Enter index of Task...");
  int index = int.parse(stdin.readLineSync()!);
  taskManager.deleteTask(index);
}

void completeTaskMenu(TaskManager taskManager) {
  print("Enter index of Task...");
  int index = int.parse(stdin.readLineSync()!);
  taskManager.completeTask(index);
}

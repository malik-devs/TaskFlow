import 'dart:io';
import 'package:task_flow/enums/status.dart';
import 'package:task_flow/managers/task_manager.dart';
import 'package:task_flow/models/task.dart';

void main() async {
  bool flag = true;
  TaskManager taskManager = TaskManager();
  await taskManager.loadTasks();
  do {
    print("===== TaskFlow =====");
    print("1. Add Task ");
    print("2. Show Tasks");
    print("3. Complete Task");
    print("4. Delete Task");
    print("5. Search Tasks");
    print("6. Filter Tasks");
    print("7. Sort Tasks");
    print("8. Exit");
    stdout.write("Choose an option: ");
    int choice = checkInput();
    if (checkChoice(1, 8, choice)) {
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
          searchMenu(taskManager);
          break;
        case 6:
          filterMenu(taskManager);
          break;
        case 7:
          sortMenu(taskManager);
          break;
        case 8:
          flag = false;
          break;
      }
    }
  } while (flag);
  await taskManager.saveTasks();
}

void waitToPress() {
  print("Press Enter to continue");
  stdin.readLineSync();
}

int checkInput() {
  while (true) {
    int? input = int.tryParse(stdin.readLineSync()!);
    if (input != null) {
      return input;
    }
    print("The input wronge try agian!");
  }
}

bool checkChoice(int min, int max, int choice) {
  if (choice < min || choice > max) {
    print("wronge choice!!");
    return false;
  }
  return true;
}

void addTaskMenu(TaskManager taskManager) {
  print("Enter Title of Task...");
  String title = stdin.readLineSync()!;
  taskManager.addTask(title);
}

void deleteTaskMenu(TaskManager taskManager) {
  print("Enter ID of Task...");
  int id = checkInput();
  taskManager.deleteTask(id);
}

void completeTaskMenu(TaskManager taskManager) {
  print("Enter ID of Task...");
  int id = checkInput();
  taskManager.completeTask(id);
}

void searchMenu(TaskManager taskManager) {
  print("Enter Keyword ...");
  String keyword = stdin.readLineSync()!;
  List<Task> foundTasks = taskManager.searchTasks(keyword);

  for (var task in foundTasks) {
    print("[${task.id}]. ${task.title}");
  }
  waitToPress();
}

void filterMenu(TaskManager taskManager) {
  List<Task> foundTasks;
  print("1. pending");
  print("2. completed");
  int choice = checkInput();
  if (checkChoice(1, 2, choice)) {
    switch (choice) {
      case 1:
        foundTasks = taskManager.filterTasks(Status.pending);
        for (var task in foundTasks) {
          print("[${task.id}]. ${task.title}");
        }
        waitToPress();
        break;
      case 2:
        foundTasks = taskManager.filterTasks(Status.completed);
        for (var task in foundTasks) {
          print("[${task.id}]. ${task.title}");
        }
        waitToPress();
        break;
    }
  }
}

void sortMenu(TaskManager taskManager) {
  print("1. A -> Z");
  print("2. Z -> A");
  int choice = checkInput();
  if (checkChoice(1, 2, choice)) {
    switch (choice) {
      case 1:
        taskManager.sortAZ();
        taskManager.showTasks();
        waitToPress();
        break;
      case 2:
        taskManager.sortZA();
        taskManager.showTasks();
        waitToPress();
        break;
    }
  }
}

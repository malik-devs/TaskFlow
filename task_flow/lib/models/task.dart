import 'package:task_flow/enums/status.dart';

class Task {
  String title;
  Status status;

  Task(this.title, [this.status = Status.pending]);
  void complete() {
    status = Status.completed;
  }

  bool get isCompleted => status == Status.completed;
}

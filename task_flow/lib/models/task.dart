import 'package:task_flow/enums/status.dart';

class Task {
  final int id;
  String title;
  Status status;
  final DateTime createdAt;

  bool get isCompleted => status == Status.completed;

  Task(this.id, this.title, [this.status = Status.pending, DateTime? createdAt])
    : createdAt = createdAt ?? DateTime.now();

  void complete() {
    status = Status.completed;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "status": status.name,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json["id"],
      json["title"],
      Status.values.byName(json["status"]),
      DateTime.parse(json["createdAt"]),
    );
  }
}

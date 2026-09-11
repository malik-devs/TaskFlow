class TaskNotFoundException implements Exception {
  final int id;

  TaskNotFoundException(this.id);

  @override
  String toString() {
    return "Task with ID $id was not found.";
  }
}

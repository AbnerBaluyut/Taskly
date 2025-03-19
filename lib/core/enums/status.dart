enum Status {
  todo,
  inProgress,
  completed
}

extension StatusExt on Status {

  String getTitle() {
    switch (this) {
      case Status.todo:
        return "To Do";
      case Status.inProgress:
        return "In Progress";
      case Status.completed:
        return "Completed";
    }
  }
}
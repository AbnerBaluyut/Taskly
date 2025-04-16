enum StatusEnum {
  todo,
  inProgress,
  completed
}

extension StatusExt on StatusEnum {

  String getTitle() {
    switch (this) {
      case StatusEnum.todo:
        return "To Do";
      case StatusEnum.inProgress:
        return "In Progress";
      case StatusEnum.completed:
        return "Completed";
    }
  }
}
//task item, information used for task functions
class Task{
  String? id;
  String? taskText;
  bool isDone;
  int taskPrior;

  Task({
    required this.id,
    required this.taskText,
    required this.taskPrior,
    this.isDone = false,
  });

  //list to store tasks
  static List<Task> taskList(){
    return [];
  }
}
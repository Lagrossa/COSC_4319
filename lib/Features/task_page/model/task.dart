//task item, information used for task functions
class Task{
  String? id;
  String? taskText;
  bool isDone;

  Task({
    required this.id,
    required this.taskText,
    this.isDone = false,
  });

  //list to store tasks
  static List<Task> taskList(){
    return [];
  }
}
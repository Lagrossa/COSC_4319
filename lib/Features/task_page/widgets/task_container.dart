import 'package:flutter/material.dart';
import 'package:addvisor/task_page/model/task.dart';
import 'package:addvisor/task_page/constants/colors.dart';

//container to display and interact with tasks
class taskContainer extends StatelessWidget{
  final Task task;
  final onTaskChanged;
  final onDeleteTask;

  const taskContainer({
    Key? key,
    required this.task,
    required this.onTaskChanged,
    required this.onDeleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTaskChanged(task);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon( //check box icon
          task.isDone? Icons.check_box : Icons.check_box_outline_blank,
          color: taskBlue,
        ),
        title: Text( //text displayed for task
          task.taskPrior.toString() + ' - ' + task.taskText!,
          style: TextStyle(
            fontSize: 16,
            color: taskBlack,
            decoration: task.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container( //delete icon
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: taskRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteTask(task.id);
            },
          ),
        ),
      ),
    );
  }
}
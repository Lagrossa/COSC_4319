import 'package:addvisor/Features/task_page/constants/colors.dart';
import 'package:addvisor/Features/task_page/model/task.dart';
import 'package:addvisor/Features/task_page/widgets/task_container.dart';
import 'package:flutter/material.dart';

class taskScreen extends StatefulWidget {
  taskScreen({super.key});

  @override
  State<taskScreen> createState() => _TaskState();
}

class _TaskState extends State<taskScreen> {
  final taskList = Task.taskList();
  final _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: taskWhite,
      appBar: _buildAppBar(),
      body: Stack(
        //main body of screen
        children: [
          _buildNavButtons(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'Tasks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (Task T in taskList.reversed) //display tasks list
                        taskContainer(
                          task: T,
                          onTaskChanged: _handleTaskChange,
                          onDeleteTask: _deleteTask,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            //text box to insert new tasks
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: 'Add new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  //add button
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _addTask(_taskController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: taskBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleTaskChange(Task task) {
    //change if a task is done or not
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  void _deleteTask(String id) {
    //remove the selected task
    setState(() {
      taskList.removeWhere((taskContainer) => taskContainer.id == id);
    });
  }

  void _addTask(String newTask) {
    //add new task and clear controller
    setState(() {
      taskList.add(Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        taskText: newTask,
      ));
    });
    _taskController.clear();
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: taskWhite,
      elevation: 0,
      title: Row(
        children: [
          Icon(
            Icons.menu,
            color: taskBlack,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget _buildNavButtons() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Habits',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Meds',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Symptoms',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Notes',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

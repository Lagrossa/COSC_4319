import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:addvisor/Features/task_page/widgets/task_container.dart';
import 'package:addvisor/Features/task_page/model/task.dart';
import 'package:addvisor/Features/task_page/constants/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class taskScreen extends StatefulWidget {
  taskScreen({super.key});

  @override
  State<taskScreen> createState() => _TaskState();
}

class _TaskState extends State<taskScreen> {
  final taskList = Task.taskList();
  final _taskController = TextEditingController();
  final _priorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: taskWhite,
      //appBar: _buildAppBar(),
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[600],
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Screen'),
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
              ),
              ListTile(
                leading: Icon(Icons.checklist_sharp),
                title: Text('Tasks'),
                onTap: () {
                  Navigator.pushNamed(context, "/tasks");
                },
              ),
              ListTile(
                leading: Icon(Icons.medical_services_outlined),
                title: Text('Medication'),
              ),
              ListTile(
                leading: Icon(Icons.event_repeat),
                title: Text('Trackers'),
                onTap: () {
                  Navigator.pushNamed(context, "/trackers");
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign Out'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ],
          ),
        ),
      ),

      body: Stack(
        //main body of screen
        children: [
          //_buildNavButtons(),
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
                  //text box for new task name
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 0,
                      left: 5,
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
                Expanded(
                  //text box for new task priority
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 5,
                      left: 40,
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
                      controller: _priorController,
                      decoration: InputDecoration(
                        hintText: '1 - 9',
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
                      _addTask(_taskController.text, _priorController.text);
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
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.black,
            activeColor: Colors.blue,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            tabBackgroundColor: Color.fromARGB(255, 31, 30, 30),
            selectedIndex: 1,
            onTabChange: (index) {
              switch (index) {
                case 0:
                  //settings code
                  break;
                case 1:
                  //Redundant
                  //Navigator.pushNamed(context, "/tasks");
                  break;
                case 2:
                  Navigator.pushNamed(context, "/home");
                  break;
                case 3:
                  Navigator.pushNamed(context, "/trackers");
                  break;
              }
            },
            tabs: [
              GButton(icon: Icons.settings, text: "Settings"),
              GButton(icon: Icons.calendar_month, text: "Tasks"),
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.watch, text: "Trackers"),
            ],
          ),
        ),
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

  void _addTask(String newTaskName, String newTaskPrior) {
    //add new task and clear controller
    int P;
    if (int.tryParse(newTaskPrior) == null)
      P = 1;
    else
      P = int.parse(newTaskPrior);
    if (P > 9) P = 9;
    if (P < 1) P = 1;
    setState(() {
      taskList.add(Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        taskText: newTaskName,
        taskPrior: P,
      ));
    });
    _taskController.clear();
    _priorController.clear();
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: taskBlue,
                ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: taskBlue,
                ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: taskBlue,
                ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: taskBlue,
                ),
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

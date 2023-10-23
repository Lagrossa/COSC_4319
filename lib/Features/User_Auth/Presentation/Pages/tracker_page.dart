import 'package:addvisor/Features/User_Auth/Presentation/Pages/home_screen.dart';
import 'package:addvisor/components/addtracker.dart';
import 'package:addvisor/components/habitBox.dart';
import 'package:addvisor/components/alertbox_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  List habitList = [
    /* EXAMPLES..
    ["Daily Leetcode", false],
    ["Daily Drawing", false],
    ["Do Homework", false],*/
  ];

  void tapCheckBox(bool? val, int index) {
    setState(() {
      habitList[index][1] = val;
    });
  }

  final newHabitNameController = TextEditingController();

  void createHabit() {
    showDialog(
      context: this.context,
      builder: (context) {
        return AlertboxDialog(
          controller: newHabitNameController,
          hintText: 'Enter Habit Name!',
          save: saveNewHabit,
          cancel: cancelHabitBox,
        );
      },
    );
  }

  void saveNewHabit() {
    setState(() {
      habitList.add([newHabitNameController.text, false]);
    });
    newHabitNameController.clear();
    Navigator.of(context as BuildContext).pop();
  }

  void cancelHabitBox() {
    newHabitNameController.clear();
    Navigator.of(context as BuildContext).pop();
  }

  void openHabitEdit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertboxDialog(
          controller: newHabitNameController,
          hintText: habitList[index][0],
          save: () => saveExistingHabit(index),
          cancel: cancelHabitBox,
        );
      },
    );
  }

  void saveExistingHabit(int index) {
    setState(() {
      habitList[index][0] = newHabitNameController.text;
    });
    Navigator.pop(context);
    newHabitNameController.clear();
  }

  void deleteHabit(int index) {
    setState(() {
      habitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Habit Tracker"),
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
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      floatingActionButton: AddTrackerActionButton(
        onPressed: () => createHabit(),
      ),
      body: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: (context, index) {
            return HabitBox(
              name: habitList[index][0],
              completed: habitList[index][1],
              onChanged: (value) => tapCheckBox(value, index),
              settingsTap: (context) => openHabitEdit(index),
              deleteTap: (context) => deleteHabit(index),
            );
          }),
    );
  }
}

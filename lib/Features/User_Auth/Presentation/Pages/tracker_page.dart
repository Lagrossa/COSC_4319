import 'package:addvisor/Features/User_Auth/Presentation/Pages/home_screen.dart';
import 'package:addvisor/components/addtracker.dart';
import 'package:addvisor/components/habitBox.dart';
import 'package:addvisor/components/newHabitTracker.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  List habitList = [
    ["Daily Leetcode", false],
    ["Daily Drawing", false],
    ["Do Homework", false],
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
        return NewHabitTracker(
          controller: newHabitNameController,
          save: saveNewHabit,
          cancel: cancelNewHabit,
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

  void cancelNewHabit() {
    newHabitNameController.clear();
    Navigator.of(context as BuildContext).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onChanged: (value) => tapCheckBox(value, index));
          }),
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
            selectedIndex: 3,
            onTabChange: (index) {
              switch (index) {
                case 0:
                  //settings code
                  break;
                case 1:
                  Navigator.pushNamed(context, "/tasks");
                  break;
                case 2:
                  Navigator.pushNamed(context, "/home");
                  break;
                case 3:
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
}

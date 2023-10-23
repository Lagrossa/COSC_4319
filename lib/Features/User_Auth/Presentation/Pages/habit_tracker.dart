import 'package:addvisor/components/addtracker.dart';
import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/habitBox.dart';
import 'package:addvisor/components/alertbox_dialog.dart';
import 'package:flutter/material.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  List habitList = [
    /* EXAMPLES..
    ["Practice on Leetcode", false],
    ["Daily Workout", false],
    ["Do Homework", false],*/
  ];

  /*
  Potentially:
  Habit Groups?
  Automatic assignment of habit groups based on day?

  Notify based on day?

  None - 0b_0000_0000
  Monday - 0b_0000_0001
  Tuesday - 0b_0000_0010
  Wednesday - 0b_0000_0100
  Thursday - 0b_0000_1000
  Friday - 0b_0001_0000
  Saturday - 0b_0010_0000
  Sunday - 0b_0100_0000

  Define Weekend as Sat | Sun
  Define Weekday as M | T | W | TH | F

  Use && to check day of the week based on the user's binary val (uVAL).

  bool notifyToday = Today.val & uVAL ? true : false  

  */

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
      drawer: DrawerNav(),
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

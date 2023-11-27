import 'package:addvisor/components/addtracker.dart';
import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/habitBox.dart';
import 'package:addvisor/components/alertbox_dialog.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  double percentCompleted = 0;
  late User currUser;
  late DatabaseReference dbRef;
  late Query dbQuery;
  late TextEditingController habitNameController;
  String habitName = '';

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

  @override
  void initState(){
    currUser = FirebaseAuth.instance.currentUser!;
    dbRef = FirebaseDatabase.instance.ref().child(currUser.uid).child('Habits');
    dbQuery = FirebaseDatabase.instance.ref().child(currUser.uid).child('Habits');
    habitNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    habitNameController.dispose();
    super.dispose();
  }

Widget listHabits({required Map habitList}){
    return HabitBox(
                                name: habitList['HabitName'],
                                completed: habitList['Completed'],
                                onChanged: (value) => tapCheckBox(value, habitList),
                                settingsTap: (context) => null,
                                deleteTap: (context) => dbRef.child(habitList['key']).remove(),
                                date: habitList['SavedDate'],                               
                              );
  }

  void tapCheckBox(bool? val, Map habitList) {
    setState(() {
      dbRef.child(habitList['key']).child('Completed').set(val);
    });
    updatePercent(habitList);
  }

void updatePercent(Map habitList) {
    int numCompleted = 0;
    int len = 0;
    habitList.forEach((key, value) {      
      numCompleted = key.child("Completed").value == true ? numCompleted + 1 : numCompleted;
    len = len + 1;
    });
        
    percentCompleted = numCompleted > 0 ? numCompleted / len : 0;
    print(percentCompleted);
  }

/*

  void saveNewHabit() {
    setState(() {
      habitList.add([newHabitNameController.text, false]);
    });
    newHabitNameController.clear();
    Navigator.of(context).pop();
    updatePercent();
  }

  void cancelHabitBox() {
    newHabitNameController.clear();
    Navigator.of(context).pop();
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
    updatePercent();
  }  
*/

Future<String?> createHabit() => showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: ThemeColors.secondary,
      title: Text('Add Habit'),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Enter Habit',
        ),
        controller: habitNameController,
        onSubmitted: (_) {
          Navigator.of(context).pop(habitNameController.text);
          habitNameController.clear();
        },
      ),
      actions: [
        TextButton(
          child: Text('Submit'),
          onPressed: () {
            Navigator.of(context).pop(habitNameController.text);
            habitNameController.clear();
          },
        ),
      ],
    ),
  );
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        title: const Text("Habit Tracker"),
      ),
      drawer: const DrawerNav(),
      backgroundColor: ThemeColors.background,
      floatingActionButton: FloatingActionButton(
      backgroundColor: ThemeColors.button,
      onPressed: () async{
          final habitName = await createHabit();
          if(habitName == null || habitName.isEmpty) return;

          String savedDate = DateFormat('yyy-MM-dd').format(DateTime.now());
          
          final addedHabit = <String, dynamic>{
            'HabitName' : habitName,
            'Completed' : false,
            'SavedDate' : savedDate,
            'Timestamp' : DateTime.now().toUtc().millisecondsSinceEpoch, 
          };
          dbRef.push().set(addedHabit);
        },
      child: const Icon(Icons.add),
      
    ),
      body: Flex(direction: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: CircularPercentIndicator(
              animation: true,
              //arcType: ArcType.FULL,
              curve: Curves.easeInOutCirc,
              animateFromLastPercent: true,
              animationDuration: 1000,
              backgroundColor: ThemeColors.secondary,
              progressColor: ThemeColors.tertiary,
              radius: 90,
              lineWidth: 10,
              percent: percentCompleted,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                '${(percentCompleted * 100).truncate()} %',
                style: const TextStyle(fontSize: (20)),
              ),
            ),
          ),
        ),
        /*Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: LinearPercentIndicator(
              barRadius: const Radius.circular(16),
              animation: true,
              animateFromLastPercent: true,
              animationDuration: 1000,
              curve: Curves.easeInOutCirc,
              backgroundColor: ThemeColors.secondary,
              progressColor: ThemeColors.button,
              percent: percentCompleted,
              lineHeight: 15,
            ),
          ),
        ),*/
        Expanded(
          child: SizedBox(
            child:  Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbQuery,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
            Map habitList = snapshot.value as Map;
            habitList['key'] = snapshot.key;
            return listHabits(habitList: habitList);
          },
        ),
      ),
          ),
        ),
      ]),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}
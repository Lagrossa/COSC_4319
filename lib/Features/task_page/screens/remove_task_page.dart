import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class removeTask extends StatefulWidget{
  const removeTask({Key? key}) : super(key: key);

  @override
  State<removeTask> createState() => removeTaskState();
}
class removeTaskState extends State<removeTask>{
  late User currUser;
  late DatabaseReference dbRef;
  late Query dbQuery;

  @override
  void initState(){
    currUser = FirebaseAuth.instance.currentUser!;
    dbRef = FirebaseDatabase.instance.ref().child(currUser.uid).child('Tasks');
    dbQuery = FirebaseDatabase.instance.ref().child(currUser.uid).child('Tasks');
    super.initState();
  }

  Widget listTasks({required Map taskList}){
    Color backColor = Colors.blue;
    switch(taskList['Priority']){
      case 1: backColor = Colors.blue; break;
      case 2: backColor = Colors.green; break;
      case 3: backColor = Colors.amber[400]!; break;
      case 4: backColor = Colors.orange; break;
      case 5: backColor = Colors.red; break;
    }
    String displayText = '';
    if(taskList['AllDay?']){
      displayText = 'All Day';
    }
    else{
      displayText = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(taskList['StartTime'])).toString();
      displayText += '\n' + DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(taskList['EndTime'])).toString();;
    }
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: backColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            taskList['TaskName'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          const SizedBox(height: 5,),
          Text(
            displayText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  dbRef.child(taskList['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        title: Text('Delete tasks?'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbQuery,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
            Map taskList = snapshot.value as Map;
            taskList['key'] = snapshot.key;
            return listTasks(taskList: taskList);
          },
        ),
      ),
    );
  }
}
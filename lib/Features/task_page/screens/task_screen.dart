import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'package:addvisor/Features/task_page/model/task.dart';
import 'package:addvisor/Features/task_page/model/task_data_source.dart';
import 'package:addvisor/Features/task_page/screens/task_editing_page.dart';

class taskScreen extends StatefulWidget{
  const taskScreen({Key? key}) : super(key: key);
  @override
  taskScreenState createState() => taskScreenState();
}

class taskScreenState extends State<taskScreen>{
  late DatabaseReference dbRef;
  late User currUser;


  @override
  void initState(){
    currUser = FirebaseAuth.instance.currentUser!;
    dbRef = FirebaseDatabase.instance.ref().child(currUser.uid).child('Tasks');
    super.initState();
  }

  CalendarView calendarView = CalendarView.day;
  CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        backgroundColor: ThemeColors.background,
        title: Text('Tasks'),
        centerTitle: true,
      ),
      drawer: DrawerNav(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(onPressed: () {
                setState(() {
                  calendarView = CalendarView.month;
                  calendarController.view = calendarView;
                });
              }, child: Text('Month View')),
              OutlinedButton(onPressed: () {
                setState(() {
                  calendarView = CalendarView.week;
                  calendarController.view = calendarView;
                });
              }, child: Text('Week View')),
              OutlinedButton(onPressed: () {
                setState(() {
                  calendarView = CalendarView.day;
                  calendarController.view = calendarView;
                });
              }, child: Text('Day View')),
            ],
          ),
          Expanded(
            child: StreamBuilder(
              stream: dbRef.orderByKey().onValue,
              builder: (context, snapshot){
                final taskList = <Task>[];
                if(snapshot.hasData && snapshot.data!.snapshot.exists){
                  final fullList = Map<String, dynamic>.from(
                      (snapshot.data! as DatabaseEvent).snapshot.value as Map
                  );
                  fullList.forEach((key, value) {
                    final currEntry = Map<String,dynamic>.from(value);
                    Color backColor = Colors.blue;
                    switch(currEntry['Priority']){
                      case 1: backColor = Colors.blue; break;
                      case 2: backColor = Colors.green; break;
                      case 3: backColor = Colors.amber[400]!; break;
                      case 4: backColor = Colors.orange; break;
                      case 5: backColor = Colors.red; break;
                    }
                    final addedTask = Task(
                        taskName: currEntry['TaskName'],
                        from: DateTime.parse(currEntry['StartTime']),
                        to: DateTime.parse(currEntry['EndTime']),
                        priority: currEntry['Priority'],
                        backgroundColor: backColor,
                        isAllDay: currEntry['AllDay?']
                    );
                    taskList.add(addedTask);
                  });
                }
                return SfCalendar(
                  cellBorderColor: Colors.blue,
                  view: calendarView,
                  initialSelectedDate: DateTime.now(),
                  controller: calendarController,
                  dataSource: TaskDataSource(taskList),
                  monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                    monthCellStyle: MonthCellStyle(
                      textStyle: TextStyle(color: Colors.white,),
                    ),
                  ),
                  headerStyle: CalendarHeaderStyle(
                    textStyle: TextStyle(color: Colors.white,),
                  ),
                  viewHeaderStyle: ViewHeaderStyle(
                      dayTextStyle: TextStyle(color: Colors.white),
                      dateTextStyle: TextStyle(color: Colors.white)
                  ),
                  timeSlotViewSettings: TimeSlotViewSettings(
                      timeTextStyle: TextStyle(color: Colors.white)
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TaskEditingPage(addTask: addTask))
        ),
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }
  void addTask(Task newTask){
    Map<String, dynamic> addedTask = {
      'TaskName' : newTask.taskName,
      'StartTime' : newTask.from.toString(),
      'EndTime' : newTask.to.toString(),
      'Priority' : newTask.priority,
      'AllDay?' : newTask.isAllDay,
    };
    dbRef.push().set(addedTask);
  }
}

/*
class taskScreen extends StatefulWidget{
  @override
  taskScreenState createState() => taskScreenState();
}

class taskScreenState extends State<taskScreen> {
  final _dbRef = FirebaseDatabase.instance.ref().child('Tasks');



  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Testing'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _dbRef.orderByKey().onValue,
          builder: (context, snapshot){
            final taskList = <Task>[];
            if(snapshot.hasData && snapshot.data!.snapshot.exists){
              final myStuff = Map<String, dynamic>.from(
                  (snapshot.data! as DatabaseEvent).snapshot.value as Map
              );
              myStuff.forEach((key, value) {
                final nextStuff = Map<String, dynamic>.from(value);
                /*final orderTile = ListTile(
                  title: Text(nextStuff['Name'].toString()),
                  subtitle: Text(nextStuff['Time'].toString()),
                );*/
                //tileList.add(orderTile);
                final addedTask = Task(
                  taskName: nextStuff['TaskName'],
                  from: DateTime.parse(nextStuff['StartTime']),
                  to: DateTime.parse(nextStuff['EndTime']),
                  priority: nextStuff['Priority'],
                  backgroundColor: Colors.blue,
                  isAllDay: nextStuff['AllDay?']
                );
                taskList.add(addedTask);
              });
            }
            return SfCalendar(
              dataSource: TaskDataSource(taskList),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: () {
          final newThing = <String, dynamic> {
            'TaskName' : 'Testing',
            'StartTime' : DateTime.now().toString(),
            'EndTime' : DateTime.now().add(Duration(hours: 2)).toString(),
            'Priority' : 4,
            'AllDay?' : false,
          };
          _dbRef.push().set(newThing)
          .then((_) => print('Thing has been written'))
          .catchError(
              (error) => print('Got an error $error'));
        },
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }



}*/
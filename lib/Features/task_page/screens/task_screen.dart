import 'package:addvisor/Features/task_page/screens/task_editing_page.dart';
import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:addvisor/Features/task_page/model/task.dart';
import 'package:addvisor/Features/task_page/model/task_data_source.dart';


class taskScreen extends StatefulWidget{
  const taskScreen({Key? key}) : super(key: key);
  @override
  taskScreenState createState() => taskScreenState();
}

class taskScreenState extends State<taskScreen>{
  List<Task> taskList = <Task>[];
  TaskDataSource? _events;

  @override
  void initState(){
    _events = TaskDataSource(taskList);
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
            child: SfCalendar(
              cellBorderColor: Colors.blue,
              view: calendarView,
              initialSelectedDate: DateTime.now(),
              controller: calendarController,
              dataSource: _events,
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
    _events?.appointments!.add(newTask);
    _events?.notifyListeners(
        CalendarDataSourceAction.add, <Task>[newTask]);
  }
}

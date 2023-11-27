import 'package:addvisor/Features/task_page/model/task.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//this will translate the task objects to appointment objects that are used by sfcalendar
class TaskDataSource extends CalendarDataSource{
  TaskDataSource(List<Task> source){
    appointments = source;
  }

  Task getTask(int index) => appointments![index] as Task;

  //must override getter properly retireve task data
  @override
  String getSubject(int index) => getTask(index).taskName;

  @override
  DateTime getStartTime(int index) => getTask(index).from;

  @override
  DateTime getEndTime(int index) => getTask(index).to;

  @override
  Color getColor(int index) => getTask(index).backgroundColor;

  @override
  bool isAllDay(int index) => getTask(index).isAllDay;
}
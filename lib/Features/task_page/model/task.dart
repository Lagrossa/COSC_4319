import 'package:flutter/material.dart';

class Task{
  final String taskName;
  final DateTime from;
  final DateTime to;
  final int priority;
  final Color backgroundColor;

  const Task({
   required this.taskName,
    required this.from,
    required this.to,
    required this.priority,
    required this.backgroundColor,
  });

}
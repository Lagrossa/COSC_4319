import 'package:addvisor/components/habit_heat_map.dart';
import 'package:flutter/material.dart';

class HomeBoxes extends StatelessWidget {
  final int index;

  HomeBoxes({
    required this.index,
  });

  List boxStuff = [
    Container(
      child: Column(
        children: [Text("Daily Habits")],
      ),
    ),
    Text("Daily Medication"),
    Text("Daily Tasks"),
    HabitHeatMap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(color: Colors.grey[400]),
        child: Column(children: [
          boxStuff[index],
        ]),
      ),
    );
  }
}

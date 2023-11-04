import 'package:addvisor/components/habit_heat_map.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';
import 'themeColors.dart';

class HomeBoxes extends StatelessWidget {
  final int index;

  HomeBoxes({
    required this.index,
  });

  List boxStuff = [
    Container(
      child: Column(
        children: [
          Text("Daily Habits", style: TextStyle(color: ThemeColors.grey))
        ],
      ),
    ),
    Text("Daily Medication", style: TextStyle(color: ThemeColors.grey)),
    Text("Daily Tasks", style: TextStyle(color: ThemeColors.grey)),
    Text("Idk what to put here", style: TextStyle(color: ThemeColors.grey)),
    //HabitHeatMap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: ThemeColors.ivory,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(children: [
          boxStuff[index],
        ]),
      ),
    );
  }
}

import 'package:addvisor/components/themeColors.dart';
import 'package:flutter/material.dart';

class HomeBoxes extends StatelessWidget {
  final int index;

  HomeBoxes({super.key, 
    required this.index,
  });

  List boxStuff = [
    //Daily Habits
    const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32.0),
          child: Column(
            children: [
              Icon(
                Icons.calendar_month,
                size: 100,
                color: ThemeColors.tertiary,
                shadows: [
                  Shadow(
                    color: ThemeColors.background,
                    blurRadius: 30,
                  )
                ],
              ),
              Text(
                "Daily Habits",
                style: TextStyle(color: ThemeColors.white, fontSize: 18),
              ),
            ],
          ),
        )
      ],
    ),
    //Daily Medication
    const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32.0),
          child: Column(
            children: [
              Icon(
                Icons.medication_outlined,
                size: 100,
                color: ThemeColors.tertiary,
                shadows: [
                  Shadow(
                    color: ThemeColors.background,
                    blurRadius: 30,
                  )
                ],
              ),
              Text(
                "Daily Medication",
                style: TextStyle(
                    color: ThemeColors.white,
                    fontSize: 18,
                    overflow: TextOverflow.visible),
              ),
            ],
          ),
        )
      ],
    ),
    //Daily Tasks
    const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32.0),
          child: Column(
            children: [
              Icon(
                Icons.task_alt,
                size: 100,
                color: ThemeColors.tertiary,
                shadows: [
                  Shadow(
                    color: ThemeColors.background,
                    blurRadius: 30,
                  )
                ],
              ),
              Text(
                "Daily Tasks",
                style: TextStyle(
                    color: ThemeColors.white,
                    fontSize: 18,
                    overflow: TextOverflow.visible),
              ),
            ],
          ),
        )
      ],
    ),
    //Other
    const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32.0),
          child: Column(
            children: [
              Icon(
                Icons.question_answer,
                size: 100,
                color: ThemeColors.tertiary,
                shadows: [
                  Shadow(
                    color: ThemeColors.background,
                    blurRadius: 30,
                  )
                ],
              ),
              Text(
                "Other",
                style: TextStyle(
                    color: ThemeColors.white,
                    fontSize: 18,
                    overflow: TextOverflow.visible),
              ),
            ],
          ),
        )
      ],
    ),
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
          color: ThemeColors.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(children: [
          boxStuff[index],
        ]),
      ),
    );
  }
}

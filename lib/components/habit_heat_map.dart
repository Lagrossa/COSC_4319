import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'themeColors.dart';

class HabitHeatMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int hMapLength = 40;
    return HeatMap(
      datasets: {
        DateTime.now(): 13, // Doesnt work?
        DateTime(2023, 10, 26): 4,
        DateTime(2023, 10, 23): 8,
        DateTime(2023, 10, 14): 6,
        DateTime(2023, 10, 15): 8,
        DateTime(2023, 10, 16): 13,
        DateTime(2023, 10, 19): 2,
        DateTime(2023, 10, 20): 5,
        DateTime(2023, 10, 21): 6,
        DateTime(2023, 10, 19): 2,
        DateTime(2023, 10, 19): 2,
        DateTime.now().subtract(const Duration(days: 1)): 10,
      },
      size: 40,
      defaultColor: const Color.fromARGB(255, 232, 233, 222),
      startDate: DateTime.now().subtract(Duration(days: hMapLength)),
      margin: EdgeInsets.all(5),
      endDate: DateTime.now(),
      colorMode: ColorMode.opacity,
      showColorTip: false,
      showText: true,
      textColor: ThemeColors.grey,
      scrollable: true,
      colorsets: const {
        1: Color.fromARGB(20, 23, 137, 252),
        2: Color.fromARGB(40, 23, 137, 252),
        3: Color.fromARGB(60, 23, 137, 252),
        4: Color.fromARGB(80, 23, 137, 252),
        5: Color.fromARGB(100, 23, 137, 252),
        6: Color.fromARGB(140, 23, 137, 252),
        7: Color.fromARGB(160, 23, 137, 252),
        8: Color.fromARGB(180, 23, 137, 252),
        9: Color.fromARGB(220, 23, 137, 252),
        10: ThemeColors.darkBlue,
      },
      onClick: (value) {
        // Maybe Show % Completed Alertbox?
        // Day | Tasks | Checked/Unchecked | Percent
      },
    );
  }
}

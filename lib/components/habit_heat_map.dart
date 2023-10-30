import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

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
        DateTime.now().subtract(Duration(days: 1)): 10,
      },
      size: 20,
      defaultColor: Colors.grey[300],
      startDate: DateTime.now().subtract(Duration(days: hMapLength)),
      endDate: DateTime.now(),
      colorMode: ColorMode.opacity,
      showColorTip: false,
      showText: true,
      textColor: Colors.black,
      scrollable: true,
      colorsets: {
        1: const Color.fromARGB(20, 33, 150, 243),
        2: const Color.fromARGB(40, 33, 150, 243),
        3: Color.fromARGB(59, 17, 23, 29),
        4: const Color.fromARGB(80, 33, 150, 243),
        5: const Color.fromARGB(100, 33, 150, 243),
        6: const Color.fromARGB(140, 33, 150, 243),
        7: const Color.fromARGB(160, 33, 150, 243),
        8: const Color.fromARGB(180, 33, 150, 243),
        9: const Color.fromARGB(220, 33, 150, 243),
        10: const Color.fromARGB(255, 33, 150, 243),
      },
      onClick: (value) {
        // Maybe Show % Completed Alertbox?
        // Day | Tasks | Checked/Unchecked | Percent
      },
    );
  }
}

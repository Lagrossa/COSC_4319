import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HabitHeatMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int hMapLength = 40;
    return HeatMap(
      datasets: {
        DateTime.now(): 3,
      },
      startDate: DateTime.now().subtract(Duration(days: hMapLength)),
      endDate: DateTime.now(),
      colorMode: ColorMode.opacity,
      showText: true,
      textColor: Colors.black,
      scrollable: true,
      colorsets: {
        1: Colors.red,
        3: Colors.orange,
        5: Colors.yellow,
        7: Colors.green,
        9: Colors.blue,
        11: Colors.indigo,
        13: Colors.purple,
      },
      onClick: (value) {
        // Maybe Show % Completed Alertbox?
        // Day | Tasks | Checked/Unchecked | Percent
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}

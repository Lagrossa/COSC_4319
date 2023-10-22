import 'package:flutter/material.dart';

class HabitBox extends StatelessWidget {
  final String name;
  final bool completed;
  final Function(bool?)? onChanged;

  const HabitBox({
    super.key,
    required this.name,
    required this.completed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 238, 240),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Checkbox(value: completed, onChanged: onChanged),
              Text(name),
            ],
          )),
    );
  }
}

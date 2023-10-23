import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitBox extends StatelessWidget {
  final String name;
  final bool completed;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTap;
  final Function(BuildContext)? deleteTap;

  const HabitBox({
    super.key,
    required this.name,
    required this.completed,
    required this.onChanged,
    required this.settingsTap,
    required this.deleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: settingsTap,
              backgroundColor: Colors.grey.shade600,
              icon: Icons.edit,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: deleteTap,
              backgroundColor: Colors.red.shade600,
              icon: Icons.delete_forever,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
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
      ),
    );
  }
}

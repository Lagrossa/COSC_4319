import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'themeColors.dart';

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
              backgroundColor: ThemeColors.secondary,
              icon: Icons.edit,
            ),
            SlidableAction(
                onPressed: deleteTap,
                backgroundColor: ThemeColors.button,
                icon: Icons.delete_forever,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16)))
          ],
        ),
        child: Container(
            width: 400,
            height: 90,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: ThemeColors.tertiary_on_select,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topLeft: Radius.circular(16))),
            child: Row(
              children: [
                Checkbox.adaptive(
                  value: completed,
                  onChanged: onChanged,
                  activeColor: ThemeColors.tertiary,
                ),
                Text(name),
              ],
            )),
      ),
    );
  }
}

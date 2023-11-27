import 'package:flutter/material.dart';
import 'themeColors.dart';

class AddTrackerActionButton extends StatelessWidget {
  const AddTrackerActionButton({super.key, required this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ThemeColors.button,
      onPressed: onPressed,
      child: const Icon(Icons.add),
      
    );
  }
}

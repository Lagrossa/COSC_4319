import 'package:flutter/material.dart';

class AddTrackerActionButton extends StatelessWidget {
  const AddTrackerActionButton({super.key, required this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}

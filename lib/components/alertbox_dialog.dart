import 'package:flutter/material.dart';

class AlertboxDialog extends StatelessWidget {
  final controller;
  final VoidCallback save;
  final VoidCallback cancel;
  const AlertboxDialog(
      {super.key,
      required this.controller,
      required this.save,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
      ),
      actions: [
        MaterialButton(onPressed: save, child: Text('Save')),
        MaterialButton(onPressed: cancel, child: Text('Cancel')),
      ],
    );
  }
}

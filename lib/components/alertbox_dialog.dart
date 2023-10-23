import 'package:flutter/material.dart';

class AlertboxDialog extends StatelessWidget {
  final controller;
  final VoidCallback save;
  final VoidCallback cancel;
  final String hintText;

  const AlertboxDialog({
    super.key,
    required this.controller,
    required this.save,
    required this.cancel,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
      actions: [
        MaterialButton(onPressed: save, child: Text('Save')),
        MaterialButton(onPressed: cancel, child: Text('Cancel')),
      ],
    );
  }
}

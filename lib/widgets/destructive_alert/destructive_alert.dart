import 'package:flutter/material.dart';

class DestructiveAlert extends StatelessWidget {
  const DestructiveAlert(
      {super.key,
      required this.title,
      required this.content,
      required this.cancelText,
      required this.destructiveText});

  final String title;
  final String content;
  final String cancelText;
  final String destructiveText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(cancelText),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              destructiveText,
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}

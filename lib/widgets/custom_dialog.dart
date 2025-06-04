import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String contentText;
  final Widget contentWidget;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const CustomDialog({
    required this.title,
    required this.contentText,
    required this.contentWidget,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(color: Colors.blueAccent)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          contentWidget,
          if (contentText.isNotEmpty)
            Text(contentText, style: TextStyle(color: Colors.white70)),
        ],
      ),
      backgroundColor: Colors.grey[900],
      actions: [
        TextButton(
          onPressed: onButtonPressed,
          child: Text(buttonText, style: TextStyle(color: Colors.blueAccent)),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

Widget customDialog(
    {required String message, required VoidCallback onPressed}) {
  return AlertDialog(
    content: Text(message),
    actions: [
      TextButton(
        onPressed: onPressed,
        child: const Text("OK"),
      ),
    ],
  );
}

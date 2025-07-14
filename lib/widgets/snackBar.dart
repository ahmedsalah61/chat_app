import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  const Color.fromARGB(255, 97, 147, 148);
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(text),
      action: SnackBarAction(label: "close", onPressed: () {}),
    ),
  );
}

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.color,
    required this.onPressed,
    required this.title,
  });
  final String title;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 43,
          child: Text(title, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

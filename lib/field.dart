import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  Field({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
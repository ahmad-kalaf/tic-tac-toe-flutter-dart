import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  const Field({super.key});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  String text = "X";
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        elevation: MaterialStatePropertyAll<double?>(0),
        backgroundColor: MaterialStatePropertyAll<Color?>(Colors.black),
        foregroundColor: MaterialStatePropertyAll<Color?>(Colors.white),
        shape: MaterialStatePropertyAll(CircleBorder()),
        alignment: Alignment.center,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 35,
        ),
      ),
    );
  }
}

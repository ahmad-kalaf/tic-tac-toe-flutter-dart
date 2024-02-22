import 'package:flutter/material.dart';

class kButton extends StatelessWidget {
  kButton({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}

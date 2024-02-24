import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/field.dart';

class FieldsRow extends StatelessWidget {
  const FieldsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Field(),
        Field(),
        Field(),
      ],
    );
  }
}


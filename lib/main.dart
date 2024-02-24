import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/fields_row.dart';

void main() {
  runApp(const TicTacToeGame());
}

class TicTacToeGame extends StatelessWidget {
  const TicTacToeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String currentPlayer = "X IST DRAN";
  String winner = "";
  bool allFiledsFull = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /*appBar: AppBar(
        title: Text(
          currentPlayer,
          style: GoogleFonts.getFont(
            "Bebas Neue",
            textStyle: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        centerTitle: true,
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // info-text to show whos turn it is
          Text("X / O ist dran"),
          // 9 game fileds
          FieldsRow(),
          FieldsRow(),
          FieldsRow(),
        ],
      ),
    );
  }
}

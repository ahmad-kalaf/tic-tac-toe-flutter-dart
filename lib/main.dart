import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/customRow.dart';

void main() {
  runApp(const TicTacToeGame());
}

class TicTacToeGame extends StatelessWidget {
  const TicTacToeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentPlayer,
          style: GoogleFonts.getFont(
            "Bebas Neue",
            textStyle: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                shrinkWrap: true,
                children: [
                  kButton(text: "X"),
                  kButton(text: "X"),
                  kButton(text: "X"),
                  kButton(text: "X"),
                  kButton(text: "X"),
                  kButton(text: "X"),
                  kButton(text: "X"),
                  kButton(text: "X"),
                  kButton(text: "X"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

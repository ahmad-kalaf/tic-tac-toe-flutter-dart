import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToeGame());
}

class TicTacToeGame extends StatelessWidget {
  const TicTacToeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tic Tac Toe',
      home: GameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currPlayer = 1;
  List<String> player = List.generate(9, (index) => ' ');
  var keys = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8];

  get kButtonStyle =>
      const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
        enableFeedback: false,
        overlayColor: MaterialStatePropertyAll(Colors.red),
      );

  void switchPlayer(int num) {
    setState(() {
      player[num] = currPlayer % 2 == 0 ? 'O' : 'X';
      currPlayer++;
    });
  }

  bool disableButton(int buttonKey) {
    return (player[buttonKey] == 'O' || player[buttonKey] == 'X')
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Tic Tac Toe"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              currPlayer % 2 == 0 ? 'O ist dran' : 'X ist dran',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: 9,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: disableButton(index)
                          ? null
                          : () {
                        switchPlayer(index);
                      },
                      style: kButtonStyle,
                      child: Text(
                        player[keys[index]],
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineMedium,
                      ),
                    ),
                  ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currPlayer = 1;
                player = List.generate(9, (index) => ' ');
                keys = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8];
              });
            },
            style: kButtonStyle,
            child: const Text(
              'Neustarten',
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/game_logic/game_logic.dart';
import 'constants.dart';

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

  GameLogic logic = GameLogic();

  void switchPlayer(int num) {
    setState(() {
      player[num] = currPlayer % 2 == 0 ? 'O' : 'X';
      currPlayer++;
    });
  }

  var index = 0;

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
        title: Text(
          currPlayer % 2 == 0 ? 'O ist dran' : 'X ist dran',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) => ElevatedButton(
                  onPressed: disableButton(index)
                      ? null
                      : () {
                          switchPlayer(index);
                        },
                  style: kButtonStyle,
                  child: Text(
                    player[keys[index]],
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    currPlayer = 1;
                    player = List.generate(9, (index) => ' ');
                    keys = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8];
                    index = 0;
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
            ),
          ],
        ),
      ),
    );
  }
}

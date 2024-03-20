import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const TicTacToeGame());
  // set the size for windows
  doWhenWindowReady(() {
    const initialSize = Size(300, 480);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    // appWindow.maxSize = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "Tic Tac Toe";
    appWindow.show();
  });
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
  bool currPlayerIsX = false;
  bool allButtonsDisabled = false;
  List<String> player = List.generate(9, (index) => ' ');
  List<int> winFields = [0, 0, 0];

  void switchPlayer(int num) {
    setState(() {
      player[num] = currPlayerIsX ? 'O' : 'X';
      currPlayerIsX = !currPlayerIsX;
    });
    getWinner();
  }

  void getWinner() {
    // first row
    if (player[0] != ' ' && player[0] == player[1] && player[0] == player[2]) {
      showWinner();
      setState(() {
        winFields = [0, 1, 2];
      });
    }

    // second row
    if (player[3] != ' ' && player[3] == player[4] && player[3] == player[5]) {
      showWinner();
      setState(() {
        winFields = [3, 4, 5];
      });
    }

    // third row
    if (player[6] != ' ' && player[6] == player[7] && player[6] == player[8]) {
      showWinner();
      setState(() {
        winFields = [6, 7, 8];
      });
    }

    // diagonal left-top to right-bottom
    if (player[0] != ' ' && player[0] == player[4] && player[0] == player[8]) {
      showWinner();
      setState(() {
        winFields = [0, 4, 8];
      });
    }

    // diagonal left-bottom to right-top
    if (player[6] != ' ' && player[6] == player[4] && player[6] == player[2]) {
      showWinner();
      setState(() {
        winFields = [6, 4, 2];
      });
    }

    // first column
    if (player[0] != ' ' && player[0] == player[3] && player[0] == player[6]) {
      showWinner();
      setState(() {
        winFields = [0, 3, 6];
      });
    }

    // second column
    if (player[1] != ' ' && player[1] == player[4] && player[1] == player[7]) {
      showWinner();
      setState(() {
        winFields = [1, 4, 7];
      });
    }

    // third column
    if (player[2] != ' ' && player[2] == player[5] && player[2] == player[8]) {
      showWinner();
      setState(() {
        winFields = [2, 5, 8];
      });
    }
  }

  void showWinner() {
    String winner = currPlayerIsX ? "X gewinnt!" : "O gewinnt!";
    setState(() {
      allButtonsDisabled = true;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("$winner Neustart?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currPlayerIsX = false;
                  player = List.generate(9, (index) => ' ');
                  allButtonsDisabled = false;
                  winFields = [0, 0, 0];
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                "YES",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "NO",
              ),
            ),
          ],
        ),
      );
    });
  }

  bool disableButton(int buttonKey) {
    return (allButtonsDisabled ||
            player[buttonKey] == 'O' ||
            player[buttonKey] == 'X')
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          currPlayerIsX ? 'O ist dran' : 'X ist dran',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          allButtonsDisabled ? showWinner() : null;
        },
        child: Center(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                // const SizedBox(
                //   height: 20,
                // ),
                // Expanded(
                //   child: GridView.builder(
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 3,
                //     ),
                //     itemCount: 9,
                //     itemBuilder: (context, index) => ElevatedButton(
                //       onPressed: disableButton(index)
                //           ? null
                //           : () {
                //               switchPlayer(index);
                //             },
                //       style: kButtonStyle,
                //       child: Text(
                //         player[index],
                //         style: Theme.of(context).textTheme.headlineMedium,
                //       ),
                //     ),
                //   ),
                // ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (rowIndex) => Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (columnIndex) {
                          int index = rowIndex * 3 + columnIndex;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              height: MediaQuery.sizeOf(context).height * 0.15,
                              child: ElevatedButton(
                                onPressed: disableButton(index)
                                    ? null
                                    : () {
                                        switchPlayer(index);
                                      },
                                style: ButtonStyle(
                                  backgroundColor: (!winFields.every(
                                              (element) => element == 0) &&
                                          winFields.contains(index))
                                      ? const MaterialStatePropertyAll(
                                          Colors.red)
                                      : const MaterialStatePropertyAll(
                                          Colors.greenAccent),
                                  enableFeedback: false,
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.red),
                                ),
                                child: Text(
                                  player[index],
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        allButtonsDisabled = false;
                        currPlayerIsX = false;
                        player = List.generate(9, (index) => ' ');
                        winFields = [0, 0, 0];
                      });
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.greenAccent),
                      enableFeedback: false,
                      overlayColor: MaterialStatePropertyAll(Colors.red),
                    ),
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({super.key});

  static const routeName = '/games/tic_tac_toe';

  @override
  State<TicTacToeGame> createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  bool oTurn = true;
  String winner = "";
  List<int> oList = [];
  List<int> xList = [];

  void _tapped(int index) {
    if (oList.contains(index) || xList.contains(index) || winner != "") return;

    setState(() {
      if (oTurn) {
        oList.add(index);
        if (oList.length > 3) oList.removeAt(0);
      } else {
        xList.add(index);
        if (xList.length > 3) xList.removeAt(0);
      }

      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _refreshGame() {
    setState(() {
      oList.clear();
      xList.clear();
      oTurn = true;
      winner = "";
    });
  }

  void _checkWinner() {
    if (oList.length == 3) {
      if ((oList[0] ~/ 3 == oList[1] ~/ 3 && oList[1] ~/ 3 == oList[2] ~/ 3) ||
          (oList[0] % 3 == oList[1] % 3 && oList[1] % 3 == oList[2] % 3) ||
          (oList.contains(0) && oList.contains(4) && oList.contains(8)) ||
          (oList.contains(2) && oList.contains(4) && oList.contains(6))) {
        winner = "O";
      }
    }

    if (xList.length == 3) {
      if ((xList[0] ~/ 3 == xList[1] ~/ 3 && xList[1] ~/ 3 == xList[2] ~/ 3) ||
          (xList[0] % 3 == xList[1] % 3 && xList[1] % 3 == xList[2] % 3) ||
          (xList.contains(0) && xList.contains(4) && xList.contains(8)) ||
          (xList.contains(2) && xList.contains(4) && xList.contains(6))) {
        winner = "X";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('Tic Tac Toe',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _refreshGame,
          child: const Icon(Icons.refresh),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
              Center(
                  child: Text(
                      winner == ""
                          ? "Turn: ${oTurn ? "O" : "X"}"
                          : "Winner: $winner",
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold))),
              const SizedBox(height: 14),
              GridView.builder(
                  itemCount: 9,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ((winner == "O" &&
                                            oList.contains(index)) ||
                                        (winner == "X" &&
                                            xList.contains(index)))
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary),
                            child: Center(
                              child: Text(
                                oList.contains(index)
                                    ? "O"
                                    : xList.contains(index)
                                        ? "X"
                                        : "",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ));
                  }),
              const SizedBox(height: 14),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How to Play:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1. The game starts with an empty 3x3 grid.',
                  ),
                  SizedBox(height: 4),
                  Text(
                    '2. The "O" player goes first, placing an "O" in any empty cell on the grid.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3. The "X" player then places an "X" in any remaining empty cell.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    '4. Players take turns placing their marks ("X" or "O") on the grid.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    '5. After the fourth mark of a aplyer is placed, the oldest mark of that player will be removed to make space.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    '6. The game continues with this rule until one player achieves three of their marks in a row, column, or diagonal.',
                  ),
                ],
              ),
            ])));
  }
}

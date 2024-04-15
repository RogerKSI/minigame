import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    List games = [
      ["Tic Tac Toe", "/games/tic_tac_toe"],
      ["etc", "/not_found"]
    ];

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            'Games',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: ListView.builder(
                    itemCount: games.length,
                    itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, games[index][1]);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                games[index][0],
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )),
                        ))))));
  }
}

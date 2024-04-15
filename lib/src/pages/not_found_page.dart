import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  static const routeName = '/not_found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Not Found',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Text("Not Found",
                  style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).colorScheme.primary))
            ]))));
  }
}

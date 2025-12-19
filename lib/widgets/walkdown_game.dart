import 'package:flutter/material.dart';

class WalkdownGame extends StatelessWidget {
  const WalkdownGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text('Big Text Here', style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}

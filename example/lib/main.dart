import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BoardingProgressDemo()));
}

class BoardingProgressDemo extends StatelessWidget {
  const BoardingProgressDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('BoardingProgressDemo'));
  }
}

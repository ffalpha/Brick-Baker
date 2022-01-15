import 'dart:async';

import 'package:bakerbrick/coverScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ballX = 0;
  double ballY = 0;
  bool hasGameStarted = false;

  void startGame() {
    hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        ballY -= 0.01;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        body: Center(
          child: Stack(
            children: [
              CoverScreen(hasGameStarted: hasGameStarted),
              Container(
                alignment: Alignment(ballX, ballY),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.amber[900], shape: BoxShape.circle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

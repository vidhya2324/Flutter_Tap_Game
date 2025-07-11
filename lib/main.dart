import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 120,
                minWidth: 120,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 120,
                minWidth: 120,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;
  bool initialize = false;
  int playScoreA = 0;
  int playScoreB = 0;
  @override
  Widget build(BuildContext context) {
    if (initialize == false) {
      blueCardHeight = MediaQuery.of(context).size.height / 2;
      redCardHeight = MediaQuery.of(context).size.height / 2;

      initialize = true;
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(blueCardHeight);
              setState(() {
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;
                playScoreB += 5;
              });
              double winHeight = MediaQuery.of(context).size.height - 60;

              print(winHeight);
              if (blueCardHeight > winHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(playScoreB, "B"),
                  ),
                );
                return;
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: blueCardHeight,
              color: Colors.blueAccent,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player B",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    playScoreB.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          MaterialButton(
            onPressed: () {
              print(redCardHeight);
              setState(() {
                redCardHeight = redCardHeight + 30;
                blueCardHeight = blueCardHeight - 30;
                playScoreA += 5;
              });
              double screenHeight = MediaQuery.of(context).size.height;
              double winHeight = MediaQuery.of(context).size.height - 30;

              print(screenHeight);
              print(winHeight);
              if (redCardHeight > winHeight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(playScoreA, "A"),
                  ),
                );
                return;
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: redCardHeight,
              color: Colors.redAccent,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player A",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    playScoreA.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  int score = 0;
  String player = "";
  ResultPage(this.score, this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "A" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(
              player == "A" ? "PLAYER A WON" : "PLAYER B WON",
              style: TextStyle(fontSize: 35),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text("Restart Game"),
            ),
          ],
        ),
      ),
    );
  }
}

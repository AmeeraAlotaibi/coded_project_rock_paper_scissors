import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var random = Random();
  int playerOne = 0;
  int playerTwo = 0;

  String imagePath = "assets/images/";
  String imageExt = ".png";
  //                       0        1        2
  List<String> hands = ["rock", "paper", "scissors"];

  int play() {
    return random.nextInt(3);
  }

// winner function
  String result = "";
  String winner(int playerOne, int playerTwo) {
    // Rock > scissors
    //  Scissors > paper
    // paper > rock
    if (playerOne == playerTwo) {
      result = "It's a Tie!";
    } else if (playerOne == 0 && playerTwo == 2) {
      result = "Player One Wins!";
    } else if (playerOne == 1 && playerTwo == 0) {
      result = "Player One Wins!";
    } else if (playerOne == 2 && playerTwo == 1) {
      result = "Player One Wins";
    } else {
      result = "Player Two Wins!";
    }
    return result;
  }

  // build start
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfdefda),
      appBar: AppBar(
        backgroundColor: Color(0xFFfe9300),
        title: Center(
          child: Text("Rock Paper Scissors", 
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // players row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // first player column
                Column(
                  children: [
                    Container(
                      width: 150,
                      child:
                          Image.asset(imagePath + hands[playerOne] + imageExt),
                    ),
                   
                   // player one text
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text("Player One", 
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                )
                      ),
                  ],
                ),

                // VS text
                Container(
                  margin: EdgeInsets.only(top: 100),
                  width: 30,
                  child: Center(
                    child: Text("VS", 
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xFFfe9300)),
                    )
                    )
                  ),

                // second player column
                Column(
                  children: [
                    Container(
                      width: 150,
                      child:
                          Image.asset(imagePath + hands[playerTwo] + imageExt),
                    ),
                    
                    // player two text
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text("Player Two", 
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                )
                      ),
                  ],
                )
              ],
            ),

            Container(
              width: 150,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      playerOne = play();
                      playerTwo = play();

                      winner(playerOne, playerTwo);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFfe9300),
                    
                  ),
                  child: Text("Play!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                  ),
            ),

            Text(result, style: TextStyle(
              color: Color.fromARGB(255, 55, 55, 55), 
              fontSize: 25,
              fontWeight: FontWeight.bold
              ),
              )
          ],
        ),
      ),
    );
  }
}

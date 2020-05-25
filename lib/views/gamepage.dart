import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class RPSGamePage extends StatefulWidget {
  @override
  _RPSGamePageState createState() => _RPSGamePageState();
}

class _RPSGamePageState extends State<RPSGamePage> {
  int leftbutton = 0;
  int rightbutton = 0;
  int color1 = 0xff2427e3;
  int color2 = 0xffffffff;
  int swapCounter = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(color1),
                Color(color2),
                //Colors.deepPurpleAccent,
                //Colors.redAccent
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(
                      () {
                        leftbutton = Random().nextInt(4) + 1;
                        rightbutton = Random().nextInt(4) + 1;
                        if (swapCounter == 0) {
                          swapCounter++;
                          color1 = 0xff2427e3;
                          color2 = 0xffffffff;
                        } else {
                          swapCounter = 0;
                          color1 = 0xffffffff;
                          color2 = 0xff2427e3;
                        }
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "images/file$leftbutton.png",
                          height: screenHeight * 0.5,
                        ),
                        Image.asset(
                          "images/file$rightbutton.png",
                          height: screenHeight * 0.5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

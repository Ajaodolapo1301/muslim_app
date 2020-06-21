import 'package:flutter/material.dart';




class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Tiles(
            score: 0,
            text: "Total",
          ),

          Tiles(
            score: 0,
            text: "Correct",
          ),
          Tiles(
            score: 0,
            text: "Incorrect",
          ),
          Tiles(
            score: 0,
            text: "unanswered",
          ),
        ],
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  final score;
  final  String text;
  Tiles({this.score, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(left: 20),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
//              color: Colors.black,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:Radius.circular(10) ),
                    color: Colors.blueAccent,
                  ),

                  height: 35,

                  child: Center(child: Text(score.toString(), style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)))),
            ),
            Expanded(flex: 3,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight:Radius.circular(10) ),
                    color: Colors.black54,
                  ),
                  height: 35,

                  child: Center(child: Text(text, style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold, ),))),
            )
          ],
        )
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:muslim_app/screen/getStarted.dart';




class SplashPage extends StatefulWidget {
//  final  user;
//  SplashPage({this.user});
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {





  @override
  void initState() {

    super.initState();

    Timer(Duration(seconds: 5,) , ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GetStarted()))   );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white
            ),
          ),

          Center(
            child: Container(

                height: 200,
                width: 200,
                child: Image.asset(
                  'images/quiz.png', fit: BoxFit.fitWidth,)),
          ),

        ],
      ),
    );
  }
}



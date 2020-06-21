import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ColourfulBox extends StatelessWidget {

  final String text;
  final Image  image;
  ColourfulBox({this.text,this.image});

  @override
  Widget build(BuildContext context) {
    return Container(

//      margin: EdgeInsets.only(right: 20.0, left: 20.0),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(

      ),
      child: Material(
        elevation: 5.0,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(0)),
        child: Column(
          children: <Widget>[

          ],
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:muslim_app/screen/home.dart';





class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/home.png", )
            ),
            color: Colors.white,
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.1)
                ]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },
                child: Container(

                  width: 275,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff5CA2F2),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(child: Text("Get Started", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 14, ),)),
                ),
              ),
              SizedBox(height: 28,),
              Text("Rent your favourite car, anytime anyday", style: TextStyle(fontSize: 12, color: Colors.white, letterSpacing: 1, ),)

            ],
          ),
        ),
      ),
    );
  }
}

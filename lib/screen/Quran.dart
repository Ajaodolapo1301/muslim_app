import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/Model/question.dart';
import 'package:muslim_app/Provider/QuranModel.dart';
import 'package:muslim_app/Provider/appState.dart';
import 'package:muslim_app/Reusable/score.dart';
import 'package:muslim_app/constants/colorConstants.dart';
import 'package:provider/provider.dart';




class QuranPage extends StatefulWidget {
  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> with AfterLayoutMixin<QuranPage>{
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var questionNumber =  1;
  int radioValue = 0;
  var _counter = 0;
AppState appState;
  int ans1Value = 1;
  int ans2Value = 2;
  int ans3Value = 3;
//  int ans4Value = 4;

  QuranModel quranModel;

  Timer _timer;
  int _start = 5;
  bool done =false;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
            setState(() {
              done = true;
              if (done) {
//                _scaffoldKey.currentState.showSnackBar(SnackBar(
//                  content: Text("Time's up"),
//
//                ));
              }
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  Timer timer;





  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {

  }



  @override
  Widget build(BuildContext context) {
quranModel = Provider.of<QuranModel>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Quran Quizzes",style: TextStyle(color: Colors.black),),
      ),
      body: CustomScrollView(
            slivers: <Widget>[
              SliverList(

                delegate: SliverChildListDelegate(
                   [
                Score()


                   ]

                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only( left: 20, top: 20.0, right: 20 ) ,
                sliver: SliverList(

                  delegate: SliverChildListDelegate(
                      [

                      Container(

                        width: 300,
                        height:200,
                        child:Material(color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Question $_counter", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

                                  Text(quranModel.question[0].question)
                              ],
                            ),
                          ),
                        )
                      ),

                      SizedBox(height: 10,),
//                      Container(
//                        color: Colors.white,
//                        width: 300,
//                        height:500,
//
//                        child: Column(
//                          children: <Widget>[
//                            new Row(
//                              children: <Widget>[
//                                new Radio<int>(
//                                    value: ans1Value,
//                                    groupValue: radioValue,
//                                    onChanged: handleRadioValueChanged),
//                                Text(questionBank[_counter].answers[0])
//
//
//                              ],
//                            ),
//
//                            Divider(),
//                             Row(
//                              children: <Widget>[
//                                new Radio<int>(
//                                    value: ans2Value,
//                                    groupValue: radioValue,
//                                    onChanged: handleRadioValueChanged
//                                ),
//                                Text(questionBank[_counter].answers[1])
//
//
//                              ],
//                            ),
//
//                            Divider(),
//                          Row(
//                              children: <Widget>[
//                                 Radio<int>(
//                                    value: ans3Value,
//                                    groupValue: radioValue,
//                                    onChanged: handleRadioValueChanged),
//                                 Text(questionBank[_counter].answers[2])
//                              ],
//                            ),
//
//
//
//                            InkWell(
//                              onTap: ()=> next(),
//                              child: Container(
//                                margin: EdgeInsets.only(left: 250),
//                                width: 70,
//                                height: 40,
//                                decoration: BoxDecoration(
//                                  color: kprimaryColor
//                                ),
//                                child: Center(child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)),
//                              ),
//                            )
//                          ],
//
//                        ),
//                      ),




                      ]

                  ),
                ),
              )
            ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('$_start'),
      )
    );
  }



  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      /*
      switch (radioValue) {
        case 1:
          bkgrdColor = (questionBank[_counter]["coAns"] ==
                  questionBank[_counter][ans1Value])
              ? Colors.green[50]
              : Colors.red[50];
          break;
        case 2:
          bkgrdColor = (questionBank[_counter]["coAns"] ==
                  questionBank[_counter][ans2Value])
              ? Colors.green[50]
              : Colors.red[50];
          break;
        case 3:
          bkgrdColor = (questionBank[_counter]["coAns"] ==
                  questionBank[_counter][ans3Value])
              ? Colors.green[50]
              : Colors.red[50];
          break;
        case 4:
          bkgrdColor = (questionBank[_counter]["coAns"] ==
                  questionBank[_counter][ans4Value])
              ? Colors.green[50]
              : Colors.red[50];
          break;
      }
       */
//      _counter++;
      radioValue = 0;
    });
  }




  void next(){
    _counter ++;
  }



}

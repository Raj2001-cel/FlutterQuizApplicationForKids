import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';
import 'QuizRequest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}

class MyAppState extends State<MyApp> {

  var ind = 0;
  int totalScore=0;

  int getQuestion(int optionScore) {

    setState(() {
      ind = ind + 1;
      totalScore+=optionScore;
    });
    return totalScore;
    print("index $ind");

  }
  var questions = [];
  @override
  Widget build(BuildContext context) {


    //<------Or You can do like this for multiple conditions---------







   

    // TODO: implement build
   var res = MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Quizzy')),
        body: ind<4?Column(
          children: [
            Questions(ind,getQuestions,questions,getQuestion),

          // ...(questions[ind]['answerText'] as List<Map<String,Object>>).map((answers){
          //     return Answer(getQuestion,answers['text'],answers['score']);
          //   }).toList()
          ],

        ):Center(
          child:
          Text(
            'You passed the test .... Awesome \n Total Score : ${getQuestion(0)}',
            style: TextStyle(fontSize: 23),
          ),
        ),
      ),
    );


return res;

  }
}

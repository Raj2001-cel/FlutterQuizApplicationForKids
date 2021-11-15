// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

import 'answer.dart';
import 'QuizRequest.dart';
import './main.dart';
class Questions extends StatelessWidget {
  var questionInd;
  final  Function handler;
  var questions;
  final  Function getQuestion;
  Questions(this.questionInd,this.handler, this.questions,this.getQuestion) ;
  var resp;
  @override
  Widget build(BuildContext context) {


    return  FutureBuilder<List<Map<String,Object>>>(
      future: handler(), // async work
      builder: (BuildContext context, AsyncSnapshot<List<Map<String,Object>>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return Text('Loading....');
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              resp = snapshot.data;

              return Column(
                children: [
               Text(resp[questionInd]['questionText'],
                 style: TextStyle(fontSize: 23)
               ),

        ...(resp[questionInd]['answerText'] as List<Map<String,dynamic>>).map((answers){
            return Answer(getQuestion,answers['text'],answers['score']);
          }).toList()
        ],
              );

        }
      },
    );
  }
}



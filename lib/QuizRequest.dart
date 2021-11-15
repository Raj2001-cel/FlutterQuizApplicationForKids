import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String url =  'https://opentdb.com/api.php?amount=5&category=9&difficulty=medium';
Future<http.Response> fetchAlbum() {

  // print("response is  ${http.get(Uri.parse(url))}");
  return http.get(Uri.parse(url));
}



Future<List<Map<String, Object>>>  getQuestions() async  {

    var resp = fetchAlbum();
    late List<Map<String,Object>>  questionsArray=[];
   var ans = resp.then((data) {

      // print(jsonDecode(data.body)['results']);

      var responsearray =  jsonDecode(data.body)['results'];

      responsearray.forEach((question){
        // print("QUESTION : ${question['question']}");
        // var hm = {'questionText':};
        var questionText = question['question'];
        var incorrectAnswer = question['incorrect_answers'];
        var correctAnswer = question['correct_answer'];
        var answersText = [{'text':correctAnswer,'score':1}];
        incorrectAnswer.forEach((incAns){
          var value  = {'text':incAns,'score':0};
          answersText.add(value);
        });

        questionsArray.add({'questionText':questionText,'answerText':answersText});

      });
  // responsive = data;
  // return responsive;
      // return this.questionsArray=questionsArray;

      // print("questionArray $questionsArray");
      return Future.delayed(
        const Duration(seconds: 1),
            () => questionsArray,
      );
      // questions.add(questionsArray);
    }, onError: (e) {
      print(e);
    });
    // (questionsArray[0]['answerText'] as List<Map<String,Object>>).map((answers){
    //     print(' ${answers['text']} ${answers['score']}');
    // }).toList();
    // print("response ${ans.runtimeType}");
    return  ans;
    // return questionsArray;
  }



Future<List<Map<String, Object>>> main() async {


  var type  =  await getQuestions();;
  print(type.runtimeType);
  return type;
// print("getQuestion ${getQuestion()}");
// print()
  // var resp = fetchAlbum();
  // resp.then((data) {
  //   // String hZonesString = data as String;
  //   print(jsonDecode(data.body)['results']);
  //   var questionsArray = [];
  //   var responsearray =  jsonDecode(data.body)['results'];
  //
  //   responsearray.forEach((question){
  //     print("QUESTION : ${question['question']}");
  //     // var hm = {'questionText':};
  //     var questionText = question['question'];
  //     var incorrectAnswer = question['incorrect_answers'];
  //     var correctAnswer = question['correct_answer'];
  //     var answersText = [{'text':correctAnswer,'score':1}];
  //     incorrectAnswer.forEach((incAns){
  //       var value  = {'text':incAns,'score':0};
  //       answersText.add(value);
  //     });
  //
  //     questionsArray.add({'questionText':questionText,'answerText':answersText});
  //   });
  //   questionsArray.shuffle();
  //   print("questionArray $questionsArray");
  // }, onError: (e) {
  //   print(e);
  // });
// print(questions);

}
// void  getQuestion(){
//
//   var resp = fetchAlbum();
//   resp.then((data) {
//     // String hZonesString = data as String;
//     // print(jsonDecode(data.body)['results']);
//
//     var responsearray =  jsonDecode(data.body)['results'];
//
//     responsearray.forEach((question){
//       // print("QUESTION : ${question['question']}");
//       // var hm = {'questionText':};
//       var questionText = question['question'];
//       var incorrectAnswer = question['incorrect_answers'];
//       var correctAnswer = question['correct_answer'];
//       var answersText = [{'text':correctAnswer,'score':1}];
//       incorrectAnswer.forEach((incAns){
//         var value  = {'text':incAns,'score':0};
//         answersText.add(value);
//       });
//
//       questionsArray.add({'questionText':questionText,'answerText':answersText});
//     });
//     // questionsArray.shuffle();
//     // print("questionArray $questionsArray");
//   }, onError: (e) {
//     print(e);
//   });
//   // (questionsArray[0]['answerText'] as List<Map<String,Object>>).map((answers){
//   //     print(' ${answers['text']} ${answers['score']}');
//   // }).toList();
//  print("response $questionsArray");
// }


import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var number;
final Function demo;
   var  optionScore;
   var resp;

  // ignore: use_key_in_widget_constructors
  Answer(this.demo,this.number,this.optionScore);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.greenAccent,
        textColor: Colors.black,
        child: Text(
          '${this.number}',
          style: TextStyle(fontSize: 23),

        ),
        // ignore: unnecessary_this

        onPressed: ()=>demo(this.optionScore),
      ),
    );

    // return FutureBuilder<List<Map<String,Object>>>(
    //   future: handler(), // async work
    //   builder: (BuildContext context, AsyncSnapshot<List<Map<String,Object>>> snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.waiting: return Text('Loading....');
    //       default:
    //         if (snapshot.hasError)
    //           return Text('Error: ${snapshot.error}');
    //         else
    //           resp = snapshot.data;
    //
    //         return Column(
    //           children: [
    //             Text(resp[questionInd]['questionText'],
    //                 style: TextStyle(fontSize: 23)
    //             ),
    //
    //             ...(resp[questionInd]['answerText'] as List<Map<String,Object>>).map((answers){
    //               return Answer(handler,answers['text'],answers['score']);
    //             }).toList()
    //           ],
    //         );
    //
    //     }
    //   },
    // );
  }
}

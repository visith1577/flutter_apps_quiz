import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(
    this.resultScore,
    this.resetHandler,
  );

  String get resultPhrase {
    String resultText;
    if (resultScore <= 40) {
      resultText = 'you are not bad!';
    } else if (resultScore <= 70) {
      resultText = 'Great job!, you are normal';
    } else if (resultScore <= 90) {
      resultText = 'creativity go stonks!';
    } else {
      resultText = 'Creativity 100%';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text("Restart Quiz!"),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

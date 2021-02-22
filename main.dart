import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final question = const [
    {
      "questionText": 'What\'s your\'r favorite place?',
      "answers": [
        {"text": "USA", "score": 10},
        {"text": "London", "score": 20},
        {"text": "Galle", "score": 30},
      ],
    },
    {
      "questionText": 'Where do you live?',
      "answers": [
        {"text": "Earth", "score": 10},
        {"text": "Srilanka", "score": 20},
        {"text": "My location", "score": 30},
      ],
    },
    {
      "questionText": 'Are you alive?',
      "answers": [
        {"text": "yes", "score": 10},
        {"text": "No", "score": 20},
        {"text": "Maybe", "score": 30},
      ],
    },
    {
      "questionText":
          'Have you ever thought of the following pick one that suits you ?',
      "answers": [
        {'text': "pinochchio is unlimited wood supply", 'score': 10},
        {"text": "why do you wash if you ge dirty", 'score': 20},
        {"text": "Hotdog", 'score': 30},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < question.length) {
      print("we have more questions");
    } else {
      print("end of quiz");
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 5,
        ),
        body: _questionIndex < question.length
            ? Quiz(
                questions: question,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

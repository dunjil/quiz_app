import 'package:flutter/material.dart';

import 'model/question_bank.dart';
import 'result_screen.dart';

class QuizApp extends StatefulWidget {
  final QuestionBank questionBank;
  QuizApp({this.questionBank});
  @override
  _QuizAppState createState() => _QuizAppState(questionBank: questionBank);
}

class _QuizAppState extends State<QuizApp> {
  double score = 0.0;
  double questionsAnswered = 0.0;
  final QuestionBank questionBank;
  _QuizAppState({this.questionBank});
  checkAnswer({bool selectedAnswer}) {
    if (selectedAnswer == questionBank.getCorrectAnswer()) {
      score++;
    }
    if (!questionBank.isLastQuestion()) {
      if (selectedAnswer == questionBank.getCorrectAnswer()) {
        answerIndicator.add(Icon(
          Icons.check,
          color: Colors.green,
          size: 35,
        ));
      } else {
        answerIndicator.add(Icon(
          Icons.close,
          color: Colors.red,
          size: 35,
        ));
      }
    } else {
      answerIndicator.clear();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return ResultScreen(
            score: score,
            numberOfQuestions: questionsAnswered,
            questionBank: questionBank,
          );
        }),
      );
    }
    setState(
      () {
        questionBank.nextQuestion();
      },
    );
  }

  List<Widget> answerIndicator = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                questionBank.getQuestionText(),
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
              child: FlatButton(
                  onPressed: () {
                    checkAnswer(selectedAnswer: true);
                    questionsAnswered++;
                    print("Questions answered: $questionsAnswered");
                  },
                  color: Colors.green,
                  child: Text("True", style: TextStyle(color: Colors.white)))),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: FlatButton(
                  onPressed: () {
                    checkAnswer(selectedAnswer: false);
                    questionsAnswered++;
                    print("Questions answered: $questionsAnswered");
                  },
                  color: Colors.red,
                  child: Text("False", style: TextStyle(color: Colors.white)))),
          Expanded(
            child: Row(children: answerIndicator),
          )
        ],
      ),
    );
  }
}

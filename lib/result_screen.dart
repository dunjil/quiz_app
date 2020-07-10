import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'model/question_bank.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final double score;
  final double numberOfQuestions;
  final QuestionBank questionBank;
  ResultScreen({this.score, this.numberOfQuestions, this.questionBank});

  double calculatePercentage() {
    double percentage = (score / numberOfQuestions) * 100;

    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                    calculatePercentage() > 50.0
                        ? "You scored well"
                        : "You scored badly",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text("${calculatePercentage().roundToDouble()}%",
                    style: TextStyle(
                        color: calculatePercentage() > 50.0
                            ? Colors.green
                            : Colors.red,
                        fontSize: 100,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return QuizApp(
                            questionBank: questionBank,
                          );
                        }),
                      );
                    },
                    color: Colors.green,
                    child: Text(
                      "Retake Test",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }),
                      );
                    },
                    color: Colors.green,
                    child: Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

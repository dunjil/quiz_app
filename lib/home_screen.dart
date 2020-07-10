import 'package:flutter/material.dart';
import 'package:quiz_app/model/question_bank.dart';
import 'package:quiz_app/questions_list/general_questions.dart';
import 'package:quiz_app/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Home"),
      ),
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: createButton(
                title: "Academics",
                icon: Icons.school,
                action: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuizApp(
                      questionBank:
                          QuestionBank(questionList: academicsQuestion),
                    );
                  }));
                }),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: createButton(
                title: "Current Affairs",
                icon: Icons.recent_actors,
                action: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuizApp(
                      questionBank:
                          QuestionBank(questionList: currentAffairsQuestion),
                    );
                  }));
                }),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: createButton(
                title: "Sports",
                icon: Icons.games,
                action: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuizApp(
                      questionBank: QuestionBank(questionList: sportsQuestion),
                    );
                  }));
                }),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: createButton(
                title: "General",
                icon: Icons.all_inclusive,
                action: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuizApp(
                      questionBank: QuestionBank(questionList: generalQuestion),
                    );
                  }));
                }),
          )),
        ],
      ),
    );
  }
}

FlatButton createButton({String title, IconData icon, Function action}) {
  return FlatButton(
    onPressed: action,
    color: Colors.green,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Icon(
            icon,
            color: Colors.white70,
            size: 60,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        )
      ],
    ),
  );
}

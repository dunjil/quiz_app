import 'package:quiz_app/model/question.dart';

class QuestionBank {
  final List<Question> questionList;
  QuestionBank({this.questionList});
  int currentIndex = 0;

  nextQuestion() {
    if (!isLastQuestion()) {
      currentIndex++;
    }
  }

  String getQuestionText() {
    return questionList[currentIndex].question;
  }

  bool getCorrectAnswer() {
    return questionList[currentIndex].answer;
  }

  bool isLastQuestion() {
    if (currentIndex < questionList.length - 1) {
      return false;
    } else {
      return true;
    }
  }
}

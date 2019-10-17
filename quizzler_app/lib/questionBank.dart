import 'package:quizzler_app/question.dart';

class QuestionBank
{

  int _questionNumber = -1;

  List<Question> _questionList = [
    Question('Where is the last place you would ever go?',false),
    Question('What are you completely over and done with?',true),
    Question('What memory do you just keep going back to?',false),
    Question('What’s the most immature thing your parents do?',false),
    Question('What is the most unusual fear you have?',true),
    Question('What is your favorite TV show?',false)

  ];

  List<Question> getQuestionList() => _questionList;

  Question nextQuestion()
  {
    _questionNumber++;
    if(_questionNumber < _questionList.length)
    {
      return _questionList[_questionNumber];
    }
  }

  bool isQuizFinished()
  {
    return _questionNumber >= _questionList.length - 1;
  }

  void resetQuiz()
  {
    _questionNumber = -1;
  }

  int getQuestionNumber()
  {
    return _questionNumber;
  }




}
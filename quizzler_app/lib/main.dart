import 'package:flutter/material.dart';
import 'package:quizzler_app/question.dart';
import 'package:quizzler_app/questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void main()
{
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
          child: QuizzlerPage()),
    ),
  ));
}


class QuizzlerPage extends StatefulWidget
{
  @override
  _QuizzlerPageState createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage>
{

  List<Widget> scoreList = [];
  QuestionBank questionBank = QuestionBank();
  Question question;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    question = questionBank.nextQuestion();
  }



  void addScore(bool isCorrectAnswer)
  {
    setState(()
    {
      if(isCorrectAnswer)
      {
        scoreList.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      }
      else
      {
        scoreList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    });
  }

  bool checkAnswer(bool answer)
  {
    return answer == question.getAnswer();
  }

  void updateQuestion()
  {
    int qN =  questionBank.getQuestionNumber();
    if(questionBank.isQuizFinished())
    {
      showQuizFinishedAlert();
    }
    else
    {
      setState(()
      {
        question = questionBank.nextQuestion();
      });
    }


  }

  void showQuizFinishedAlert()
  {
    Alert(
        context: context,
        title: "Quiz Finished!",
        desc: "Restart Quiz?",
        buttons: [
          DialogButton(
            child: Text(
              "No Thanks",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          DialogButton(
            child: Text(
              "Yes",
              style: TextStyle(
                  color: Colors.white
              ),

            ),
            onPressed: () {
              resetQuiz();
              Navigator.pop(context);

            },
          )
        ]
    ).show();
  }

  void resetQuiz()
  {
    setState(() {
      questionBank.resetQuiz();
      scoreList.clear();
      question = questionBank.nextQuestion();
    });

  }

  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              question.getQuestionText(),
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: ()
              {
                addScore(checkAnswer(true));
                updateQuestion();
              },
              color: Colors.green,
              child: Text(
                "True",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: ()
              {
               addScore(checkAnswer(false));
               updateQuestion();
              },
              color: Colors.red,
              child: Text(
                "False",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),

            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: scoreList,
            ),
          ),
        )
      ],
    );
  }
}


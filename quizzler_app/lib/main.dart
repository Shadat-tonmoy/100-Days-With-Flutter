import 'package:flutter/material.dart';


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

  int questionIndex = 0;
  List<Widget> scoreList = [];
  List<String> questions = [
    'Where is the last place you would ever go?',
    'What are you completely over and done with?',
    'What memory do you just keep going back to?',
    'What’s the most immature thing your parents do?',
    'What is the most unusual fear you have?',
    'What is your favorite TV show?'];

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

  void updateQuestion()
  {
    questionIndex++;
    setState(()
    {
      questionIndex = questionIndex >= questions.length ? 0 : questionIndex;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              questions[questionIndex],
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
                addScore(true);
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
               addScore(false);
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


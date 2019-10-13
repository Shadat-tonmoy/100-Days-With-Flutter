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

  List<Widget> scoreList = [];

  void addScore(bool isCorrectAnswer)
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
              "Question Goes Here there....",
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
                setState(()
                {
                  addScore(true);
                });


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
                setState(()
                {
                  addScore(false);
                });
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


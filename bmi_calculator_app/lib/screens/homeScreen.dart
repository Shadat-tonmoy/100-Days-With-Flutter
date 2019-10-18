import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputCard(Color(0xff1d1e33)),
                  ),
                  Expanded(
                    child: InputCard(Color(0xff1d1e33)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputCard(Color(0xff1d1e33)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InputCard(Color(0xff1d1e33)),
                  ),
                  Expanded(
                    child: InputCard(Color(0xff1d1e33)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputCard extends StatelessWidget {

  Color color;

  InputCard(this.color);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
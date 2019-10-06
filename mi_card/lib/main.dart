import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
  runApp(miCardApp());
}

class miCardApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/myImage.jpg"),
                    radius: 50,
                  ),
                ),
                Container(
                  child: Text("Shadat Tonmoy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico"
                    ),

                  ),
                  padding: EdgeInsets.all(2),
                ),
                Container(
                  child: Text("Software Engineer",
                    style: TextStyle(
                      color: Colors.teal[100],
                      fontSize: 16,
                      letterSpacing: 2.5,
                      fontFamily: 'SourceSansPro'
                    ),

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}

//Container(
//color: Colors.white,
//child: Text("Hello World"),
//margin: EdgeInsets.all(32),
//width: 64,
//height: 64,
//padding: EdgeInsets.all(8),
//),
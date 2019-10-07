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
                SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.teal[200],
                    indent: 16,
                    endIndent: 16,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            size: 24,
                            color: Colors.teal[600],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "+8801965036172",
                            style: TextStyle(
                              fontFamily: "SourceSansProRegular",
                              fontSize: 16,
                              color: Colors.teal[500]

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.mail,
                            size: 24,
                            color: Colors.teal[600],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "shadat.tonmoy@gmail.com",
                            style: TextStyle(
                              color: Colors.teal[500],
                              fontSize: 16,
                              fontFamily: "SourceSansProRegular"
                            ),
                          )
                        ],

                      ),
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
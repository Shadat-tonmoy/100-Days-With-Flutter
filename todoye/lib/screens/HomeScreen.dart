import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Colors.blueAccent,
        child: Icon(
            Icons.add
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32.0,
                    ),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        color: Colors.blueAccent,
                        size: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      "Todoey",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "12 Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0
                      ),

                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))
                  ),
                  child: ListView(
                    padding: EdgeInsets.only(top: 8.0,bottom: 64.0),
                    children: <Widget>[
                      TODOItem(
                        title: "Task 1",
                        isDone: true,
                      ),
                      TODOItem(
                        title: "Task 2",
                        isDone: false,
                      ),
                      TODOItem(
                        title: "Task 3",
                        isDone: true,
                      ),
                      TODOItem(
                        title: "Task 1",
                        isDone: true,
                      ),
                      TODOItem(
                        title: "Task 2",
                        isDone: false,
                      ),
                      TODOItem(
                        title: "Task 3",
                        isDone: true,
                      ),
                    ],
                  ),
                ),



              )


            ],
          ),
        ),
      ),

    );
  }
}

class TODOItem extends StatelessWidget
{

  final String title;
  final bool isDone;
  final Function onCheckBoxClicked;

  TODOItem({this.title,this.isDone,this.onCheckBoxClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                    title
                ),
              ),
              Checkbox(
                onChanged: (value){

                },
                value: isDone,
              )

            ],
          ),
          Divider(
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/models/Task.dart';
import 'package:todoye/widgets/HomeScreenWidgets.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => ModalBottomSheetBuilder(),
              isScrollControlled: true);
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
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
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${Provider.of<TaskData>(context).totalTask} Task",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0))),
                  child: TodoItemList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




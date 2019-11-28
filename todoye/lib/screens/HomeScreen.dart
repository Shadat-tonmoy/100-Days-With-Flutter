import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todoye/models/Task.dart';
import 'package:todoye/widgets/HomeScreenWidgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{

  final List<Task> taskList = [
    Task(
      title: "Task 1",
    ),
    Task(
      title: "Task 2",
    ),
    Task(
      title: "Task 3",
    ),
    Task(
      title: "Task 1",
    ),
    Task(
      title: "Task 2",
    ),
    Task(
      title: "Task 3",
    )
  ];

  void addNewTask(Task task)
  {
    setState(() {
      taskList.insert(0, task);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => ModalBottomSheetBuilder(onTaskAddedCallback: addNewTask,),
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
                      "${taskList.length} Task",
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
                  child: TodoItemList(taskList: taskList),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



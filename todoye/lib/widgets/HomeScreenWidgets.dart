import 'package:flutter/material.dart';
import 'package:todoye/helpers/DateTimeHelper.dart';
import 'package:todoye/models/Task.dart';

class TODOItem extends StatelessWidget
{

  final String title;
  final Function onCheckBoxClicked;
  final bool isChecked;

  TODOItem({this.title,this.onCheckBoxClicked, this.isChecked = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title),
                      Text(
                        isChecked ? "Last Done at : ${DateTimeHelper.getCurrentTimeString()}" : "Not Done",
                        style: TextStyle(
                            color: Colors.grey[600]
                        ),

                      )
                    ],

                  )
              ),
              Checkbox(
//                onChanged: checkboxStateChangeCallback,
                value: isChecked,
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


class ModalBottomSheetBuilder extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
     color: Colors.blueAccent,
      child: Container(
        margin: EdgeInsets.only(top: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),topRight: Radius.circular(16.0)),
            color: Colors.white,
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),topRight: Radius.circular(16.0)),
                  color: Colors.blueAccent,
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Add New Task",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0
                      ),
                    ),
                  )
                ],
              ),

            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                      Icons.edit,
                  ),
                  hintText: "Enter Task Name",
                ),
                autofocus: true,


              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: MaterialButton(
                padding: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(16.0)
                ),
                color: Colors.blueAccent,
                onPressed: (){

                },
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}

class TodoItemList extends StatelessWidget
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


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 8.0, bottom: 64.0),
      children: <Widget>[
        TODOItem(
          title: taskList[0].title,
        ),
        TODOItem(
          title: taskList[1].title,
        ),
        TODOItem(
          title: taskList[2].title,
        ),
        TODOItem(
          title: taskList[3].title,
        ),
        TODOItem(
          title: taskList[4].title,
        ),
        TODOItem(
          title: taskList[5].title,
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';

class Task
{
  final String title;
  bool isDone;

  Task({this.title,this.isDone = false});

  void toggleIsDone()
  {
    isDone = !isDone;
  }



}

class TaskData extends ChangeNotifier
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

  void addTask(Task task)
  {
    taskList.insert(0, task);
    notifyListeners();
  }

  void toggleTaskState(int index)
  {
    taskList[index].toggleIsDone();
    notifyListeners();
  }

  int get totalTask
  {
    return taskList.length;

  }
}

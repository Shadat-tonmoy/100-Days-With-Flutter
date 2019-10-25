import 'dart:io';

void main()
{
  performTask();

}

void performTask() async
{
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1()
{
  String result = "Task1 Result";
  print("Task 1");
}

Future<String> task2() async
{
  String result;
  await Future.delayed(Duration(seconds: 3), (){
    result = "Task2 Result";
    print("Task 2");
  });
  return result;

}

void task3(String task2Result)
{
  String result = "Task3 Result";
  print("Task 3 Task 2 Result $task2Result");
}
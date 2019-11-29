import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/models/Task.dart';
import 'package:todoye/screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
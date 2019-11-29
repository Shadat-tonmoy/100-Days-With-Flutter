import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{

//  String data = "123456";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data> (
      builder: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: AppbarText(),
          ),
          body: Column(
            children: <Widget>[
              Level1(),
              AppTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
class AppTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
      child: TextField(
        onChanged: (newText){
          Provider.of<Data>(context).updateData(newText);

        },
        decoration: InputDecoration(
            hintText: "Enter Text Here"
        ),

      ),
    );
  }
}

class Level1 extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level3(),
    );
  }
}

class Level3 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        Provider.of<Data>(context).data
      ),
    );
  }
}

class AppbarText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context).data
    );
  }
}


class Data extends ChangeNotifier
{
  String data = "My Top Secret Data";

  void updateData(String newData)
  {
    data = newData;
    if(newData.length == 0)
      data = "My Top Secret Data";
    notifyListeners();
  }
}




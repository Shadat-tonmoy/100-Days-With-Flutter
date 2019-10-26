import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
{

  @override
  void initState()
  {
    super.initState();
    print("Mathod Called Init State");
  }


  @override
  Widget build(BuildContext context)
  {
    print("Method Called Build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Second Screen"
        ),
      ),
      body: new SecondScreenBody(),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Method Called Deactivate");
  }
}

class SecondScreenBody extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Center Text"
        ),
      ),
    );
  }
}
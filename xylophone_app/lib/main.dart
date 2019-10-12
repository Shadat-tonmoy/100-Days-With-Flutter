import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget
{

  void playSound(int soundNumber)
  {
    final AudioCache audioCache = new AudioCache();
    audioCache.play("note$soundNumber.wav");
  }

  Widget buildKey({Color color, int soundNumber})
  {
    return FlatButton(
      color: color,
      onPressed: ()
      {
        playSound(soundNumber);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded( 
                child: buildKey(color: Colors.red, soundNumber: 1),
              ),
              Expanded( 
                child: buildKey(color: Colors.orange,soundNumber: 2),
              ),
              Expanded( 
                child: buildKey(color: Colors.yellow,soundNumber: 3),
              ),
              Expanded(
                  child: buildKey(color: Colors.green,soundNumber: 4),
              ),
              Expanded(
                child: buildKey(color: Colors.teal,soundNumber: 5),
              ),
              Expanded(
                child: buildKey(color: Colors.blue,soundNumber: 6),
              ),
              Expanded(
                child: buildKey(color: Colors.purple,soundNumber: 7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

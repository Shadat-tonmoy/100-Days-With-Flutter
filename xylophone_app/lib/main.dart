import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget
{

  void playSound({int soundNumber})
  {
    final AudioCache audioCache = new AudioCache();
    audioCache.play("note$soundNumber.wav");
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
                child: FlatButton(
                  color: Colors.red,
                  onPressed: ()
                  {
                    playSound(soundNumber: 1);

                  },
                ),
              ),
              Expanded( 
                child: FlatButton(
                  color: Colors.orange,
                  onPressed: ()
                  {
                    playSound(soundNumber: 2);
                  },
                ),
              ),
              Expanded( 
                child: FlatButton(
                  color: Colors.yellow,
                  onPressed: ()
                  {
                    playSound(soundNumber: 3);
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.green,
                  onPressed: ()
                  {
                    playSound(soundNumber: 4);
                  },
                ),
              ),
              Expanded( 
                child: FlatButton( 
                  color: Colors.teal,
                  onPressed: ()
                  {
                    playSound(soundNumber: 5);
                  },
                ),
              ),
              Expanded( 
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: ()
                  {
                    playSound(soundNumber: 6);
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.purple,
                  onPressed: ()
                  {
                    playSound(soundNumber: 7);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

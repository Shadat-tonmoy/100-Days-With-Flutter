import 'package:clima_weather_app/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LineDivider extends StatelessWidget {
  const LineDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[400],
      indent: 16.0,
      endIndent: 16.0,
    );
  }
}

class SubInfoText extends StatelessWidget {
  final String title,text;
  final IconData icon;


  SubInfoText({this.text, this.icon,this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 16.0,
          ),
          Icon(
            icon,
            size: 18.0,
            color: Colors.grey[700],
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
              title
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            width: 16.0,
          )
        ],
      ),
    );
  }
}

class MainInfoText extends StatelessWidget {
  final String infoText;
  final double padding, fontSize;
  final Color color;

  MainInfoText({this.infoText, this.fontSize, this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(
          infoText,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

class WeatherInfoLoadingView extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromARGB(170, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitWave(
            color: Colors.white,
            size: 32.0,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              FETCHING_DATA,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}
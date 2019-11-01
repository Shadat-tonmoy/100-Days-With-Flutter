import 'package:clima_weather_app/constants/styles.dart';
import 'package:flutter/material.dart';

String _cityName;

class SearchCityScreen extends StatefulWidget
{
  @override
  _SearchCityScreenState createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("images/city_bg.png"),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            color: Color.fromARGB(150, 0, 0, 0),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: inputFieldStyle,
                    onChanged: (input)
                    {
//                      print(input);
                      _cityName = input;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: FlatButton(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.green[700])
                      ),
                      color: Colors.green[700],
                      onPressed: ()
                      {
                        print("City Name Enterred $_cityName");

                      },
                      child: Text(
                        "Get Weather",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

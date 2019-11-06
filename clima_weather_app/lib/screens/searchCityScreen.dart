import 'package:clima_weather_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchCityScreen extends StatefulWidget
{
  @override
  _SearchCityScreenState createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen>
{
  String _cityName;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "BACK",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                          ),
                        )
                      ],
                    ),
                  )
                ),
                SizedBox(
                  height: 16.0,
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
                        if(_cityName!=null && _cityName.length > 0 )
                          Navigator.pop(context, _cityName);
                        else
                        {
                          Fluttertoast.showToast(
                              msg: "Please Enter A Valid City Name",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 12.0
                          );

                        }

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

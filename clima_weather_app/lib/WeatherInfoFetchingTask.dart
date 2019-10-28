import 'package:clima_weather_app/model/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

const API_KEY = "186123f11111f42d1f417029af378cf3";

class WeatherInfoFetchingTask
{

  final Location _location;
  String _url;

  WeatherInfoFetchingTask(this._location)
  {
    _url = "https://samples.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitude}&appid=$API_KEY";

  }

  Future<String> fetchWeatherInfo() async
  {

    Response response = await get(_url);
    String weatherInfo;
    if(response.statusCode == 200)
    {
      String apiResponse = response.body;
      dynamic responseJSON = jsonDecode(apiResponse);
      double longitude = responseJSON["coord"]["lon"];
      double latitude = responseJSON["coord"]["lat"];
      String weatherTitle = responseJSON["weather"][0]["main"];
      double temperature = responseJSON["main"]["temp"];
      double pressure = responseJSON["main"]["pressure"];
      int humidity = responseJSON["main"]["humidity"];
      weatherInfo = "Longitude : $longitude\nLatitude : $latitude\nTitle : $weatherTitle\nTemparature : $temperature\n"
          "Pressure : $pressure\nHumidity : $humidity";
    }
    else
    {
      weatherInfo = "Error in api ${response.statusCode}";
    }

    return weatherInfo;
  }




}
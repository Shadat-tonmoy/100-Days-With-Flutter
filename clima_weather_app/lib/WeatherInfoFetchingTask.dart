import 'package:clima_weather_app/model/WeatherData.dart';
import 'package:clima_weather_app/model/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

const API_KEY = "186123f11111f42d1f417029af378cf3";

class WeatherInfoFetchingTask
{

  Location _location;
  String _url, _urlForCity, _cityName;

  WeatherInfoFetchingTask(this._location)
  {
    _url = "https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitude}&appid=$API_KEY&units=metric";
    _urlForCity = "https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=$API_KEY";
  }

  Future<WeatherData> fetchWeatherInfo() async
  {

    Response response = await get(_url);
    String weatherInfo;
    WeatherData weatherData;
    if(response.statusCode == 200)
    {
      String apiResponse = response.body;
      dynamic responseJSON = jsonDecode(apiResponse);
      double longitude = responseJSON["coord"]["lon"];
      double latitude = responseJSON["coord"]["lat"];
      String weatherTitle = responseJSON["weather"][0]["main"];
      String cityName = responseJSON["name"];
      double temperature = responseJSON["main"]["temp"];
      double windSpeed = responseJSON["wind"]["speed"];
      int pressure = responseJSON["main"]["pressure"];
      int humidity = responseJSON["main"]["humidity"];
      weatherInfo = "Longitude : $longitude\nLatitude : $latitude\nTitle : $weatherTitle\nTemparature : $temperature\n"
          "Pressure : $pressure\nHumidity : $humidity";
      _location.cityName = cityName;
      weatherData  = WeatherData(_location,weatherTitle,temperature,pressure,humidity,windSpeed);
    }
    else
    {
      weatherInfo = "Error in api ${response.statusCode}";
    }

    return weatherData;
  }

  Future<WeatherData> fetchWeatherInfoByCityName(String cityName) async
  {

    this._cityName = cityName;
    Response response = await get(_urlForCity);
    if(response.statusCode == 200)
    {
      String apiResponse = response.body;
      return getWeatherDataFromResponse(apiResponse);
    }
    return null;
  }

  WeatherData getWeatherDataFromResponse(String apiResponse)
  {
    WeatherData weatherData;
    dynamic responseJSON = jsonDecode(apiResponse);
    double longitude = responseJSON["coord"]["lon"];
    double latitude = responseJSON["coord"]["lat"];
    String weatherTitle = responseJSON["weather"][0]["main"];
    String cityName = responseJSON["name"];
    double temperature = responseJSON["main"]["temp"];
    double windSpeed = responseJSON["wind"]["speed"];
    int pressure = responseJSON["main"]["pressure"];
    int humidity = responseJSON["main"]["humidity"];
    _location.longitude = longitude;
    _location.latitude = latitude;
    _location.cityName = cityName;
    weatherData  = WeatherData(_location,weatherTitle,temperature,pressure,humidity,windSpeed);
    return weatherData;

  }



}
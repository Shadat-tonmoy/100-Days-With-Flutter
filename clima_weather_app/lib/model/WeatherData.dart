import 'package:clima_weather_app/model/location.dart';

class WeatherData
{
  String _weatherTitle;
  var _temperature,_windSpeed;
  int _pressure;
  int _humidity;
  Location _location;

  WeatherData(this._location, this._weatherTitle,this._temperature,this._pressure,this._humidity,this._windSpeed);

  int get humidity => _humidity;

  set humidity(int value)
  {
    _humidity = value;
  }

  int get pressure => _pressure;

  set pressure(int value) {
    _pressure = value;
  }

  get temperature => _temperature;

  set temperature(value)
  {
    _temperature = value;
  }

  String get weatherTitle => _weatherTitle;

  set weatherTitle(String value)
  {
    _weatherTitle = value;
  }

  Location get location => _location;

  set location(Location value)
  {
    _location = value;
  }


  get windSpeed => _windSpeed;

  set windSpeed(value) {
    _windSpeed = value;
  }

  @override
  String toString() {
    return 'WeatherData{_weatherTitle: $_weatherTitle, _temperature: $_temperature, _pressure: $_pressure, _humidity: $_humidity, _location: ${_location.toString()}}';
  }


}
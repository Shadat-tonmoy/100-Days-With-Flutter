import 'package:geolocator/geolocator.dart';

class Location
{

  double _longitude, _latitude;
  String _cityName;

  Future<void> getLocation() async
  {
    try
    {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _longitude = position.longitude;
      _latitude = position.latitude;
    }
    catch(exception)
    {

    }

  }

  get latitude => _latitude;

  get longitude => _longitude;

  String get cityName => _cityName;

  set cityName(String value)
  {
    _cityName = value;
  }


  set longitude(double value) {
    _longitude = value;
  }

  @override
  String toString()
  {
    return 'Location{_longitude: $_longitude, _latitude: $_latitude, _cityName: $_cityName}';
  }

  set latitude(value) {
    _latitude = value;
  }


}
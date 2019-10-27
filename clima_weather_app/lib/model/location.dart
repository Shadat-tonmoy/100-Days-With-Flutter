import 'package:geolocator/geolocator.dart';

class Location
{

  double _longitude, _latitude;

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


}
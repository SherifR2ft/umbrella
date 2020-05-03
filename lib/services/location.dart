import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longitude;

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print('!!!!!!!!!!!!!!!!!!!!location');
      print(e);
    }
  }

  getLatitude() async => _latitude;
  getLongitude() async => _longitude;
}

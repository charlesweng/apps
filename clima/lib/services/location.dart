import 'package:geolocator/geolocator.dart';

class Location {
  double lattitude;
  double longitude;

  get getLattitude => this.lattitude;

  get getLongitude => this.longitude;

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission denied forever.');
    }

    try {
      Position position = await Geolocator.getCurrentPosition().timeout(const Duration(seconds: 30));
      lattitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
      lattitude = -double.infinity;
      longitude = -double.infinity;
    }
  }
}

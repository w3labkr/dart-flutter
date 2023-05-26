import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<LatLng> getCurrentLocation() async {
    double latitude = 0;
    double longitude = 0;

    bool permission = await _determinePermission();

    if (permission) {
      Position position = await _getPosition();

      latitude = position.latitude;
      longitude = position.longitude;
    }

    return LatLng(latitude, longitude);
  }

  Future<bool> _determinePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.value(false);
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.value(false);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.value(false);
    }

    return Future.value(true);
  }

  Future<Position> _getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}

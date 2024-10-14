import 'package:geolocator/geolocator.dart';

class LocationService {
  Position? position;

  //Make LocationService class singleton
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  Future<bool> get _permissionIsGranted async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<(double lat, double lon)> getCurrentLocation() async {
    if (!await _permissionIsGranted) {
      await Geolocator.openAppSettings();
    }

    position ??= await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best),
    );
    return (position!.latitude, position!.longitude);
  }
}

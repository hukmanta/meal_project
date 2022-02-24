import 'package:geolocator/geolocator.dart';

/// class yang digunakan untuk mendapatkan posisi device user
class LocationUtils {
  static Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition().timeout(const Duration(seconds: 60),
        onTimeout: () async {
      return await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true, timeLimit: const Duration(seconds: 300));
    });
  }
}

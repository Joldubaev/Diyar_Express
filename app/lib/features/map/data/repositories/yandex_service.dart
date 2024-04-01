abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();
  Future<bool> requestPermission();
  Future<bool> checkPermission();
}

class LocationService implements AppLocation {
  final defaultLocation = BiskekLocation();

  @override
  Future<AppLatLong> getCurrentLocation() async {
    return defaultLocation;
  }

  @override
  Future<bool> requestPermission() async {
    return true;
  }

  @override
  Future<bool> checkPermission() async {
    return true;
  }
}

class AppLatLong {
  AppLatLong({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;
}

class BiskekLocation extends AppLatLong {
  BiskekLocation({
    super.latitude = 42.870000,
    super.longitude = 74.590000,
  });
}

import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationRepo {
  Future<bool> handleLocationPermission();
  Future<Position> getCurrentPosition();
  Future<Placemark> getAddressFromLatLng(double lat, double long);
  Future<void> moveMap(
      Completer<GoogleMapController> controller, double lat, double long);
}

// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../generated/locale_keys.g.dart';
import '../domain/location_repo.dart';

class LocationRepoImp implements LocationRepo {
  @override
  Future<Placemark> getAddressFromLatLng(double lat, double long) async {
    return await placemarkFromCoordinates(lat, long)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      return place;
    });
  }

  @override
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocaleKeys.Location_permissions_are_denied.tr();
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw LocaleKeys
                .Location_permissions_are_permanently_denied_we_cannot_request_permissions
            .tr();
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> moveMap(Completer<GoogleMapController> controller, double lat,
      double long) async {
    final GoogleMapController controllerr = await controller.future;
    controllerr.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        // bearing: 192.8334901395799,
        target: LatLng(lat, long),
        // tilt: 59.440717697143555,
        zoom: 20)));
  }
}

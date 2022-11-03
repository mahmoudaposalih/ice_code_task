import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../domain/location_repo.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationRepo}) : super(const LocationState());
  LocationRepo locationRepo;

  Future<Placemark?> getAddressFromLatLng(double lat, double long) async {
    emit(state.copyWith(locationStatus: LocationStatus.loading));
    try {
      Placemark palce = await locationRepo.getAddressFromLatLng(lat, long);
      emit(state.copyWith(
          locationStatus: LocationStatus.success,
          address: palce,
          lat: lat,
          long: long));
      return palce;
    } catch (exception) {
      emit(
        state.copyWith(
          locationStatus: LocationStatus.failure,
          exception: exception.toString(),
        ),
      );
      return null;
    }
  }

  Future<Position?> getCurrentPosition() async {
    try {
      await handleLocationPermission();
      return locationRepo.getCurrentPosition();
    } catch (exception) {
      emit(
        state.copyWith(
          locationStatus: LocationStatus.failure,
          exception: exception.toString(),
        ),
      );
    }
    return null;
  }

  Future<bool> handleLocationPermission() {
    try {
      return locationRepo.handleLocationPermission();
    } catch (exception) {
      emit(
        state.copyWith(
          locationStatus: LocationStatus.failure,
          exception: exception.toString(),
        ),
      );
      return Future(() => false);
    }
  }

  Future<void> moveMap(
      Completer<GoogleMapController> controller, double lat, double long) {
    return locationRepo.moveMap(controller, lat, long);
  }
}

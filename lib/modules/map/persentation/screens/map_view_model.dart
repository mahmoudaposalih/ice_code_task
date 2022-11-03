import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../cubit/location_cubit.dart';

class MapViewModel {
  final markers = <Marker>{};
  late String address;
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> controller = Completer();

  moveMap(BuildContext context, double lat, double long) {
    BlocProvider.of<LocationCubit>(context).moveMap(controller, lat, long);
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId("location"), position: LatLng(lat, long)));
    BlocProvider.of<LocationCubit>(context).getAddressFromLatLng(lat, long);
  }

  getCurrentLocation(BuildContext context) {
    BlocProvider.of<LocationCubit>(context)
        .getCurrentPosition()
        .then((value) => moveMap(context, value!.latitude, value.longitude));
  }
}

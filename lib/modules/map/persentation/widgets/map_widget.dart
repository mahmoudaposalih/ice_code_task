import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../screens/map_view_model.dart';

class MapWidget extends StatefulWidget {
  final MapViewModel mapViewModel;
  const MapWidget({Key? key, required this.mapViewModel}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      markers: widget.mapViewModel.markers,
      initialCameraPosition: widget.mapViewModel.kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        widget.mapViewModel.controller.complete(controller);
      },
      onTap: (lating) async {
        widget.mapViewModel.moveMap(context, lating.latitude, lating.longitude);
        setState(() {});
      },
    );
  }
}

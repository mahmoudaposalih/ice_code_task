import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../screens/map_view_model.dart';

class CurrentLocationIcon extends StatelessWidget {
  final MapViewModel mapViewModel;
  const CurrentLocationIcon({Key? key, required this.mapViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: InkWell(
        onTap: () {
          mapViewModel.getCurrentLocation(context);
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.location_searching,
              color: AppColor.primery,
            )),
      ),
    );
  }
}

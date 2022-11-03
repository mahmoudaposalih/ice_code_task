import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/app_colors.dart';
import '../../../../sharedUi/main_text.dart';
import '../../cubit/location_cubit.dart';
import '../screens/map_view_model.dart';

class AdressBox extends StatelessWidget {
  final MapViewModel mapViewModel;
  const AdressBox({Key? key, required this.mapViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          width: 90.w,
          // height: 60.hi,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
            switch (state.locationStatus) {
              case LocationStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case LocationStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case LocationStatus.success:
                Placemark place = state.address!;
                String currentAddress =
                    '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, {
                          "address": currentAddress,
                          "lat": state.lat,
                          "long": state.long
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: MainText(
                        txt: currentAddress,
                        size: 15.spi,
                        fontColor: AppColor.primery,
                      ),
                    ),
                  ],
                );

              case LocationStatus.failure:
                return MainText(
                  txt: state.exception,
                  size: 15.spi,
                  fontColor: AppColor.primery,
                );
            }
          }),
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
        ),
      ),
    );
  }
}

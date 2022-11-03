import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:ice_code_task/sharedUi/Navig.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constants/app_colors.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../map/persentation/screens/map_screen.dart';
import '../../../../sharedUi/custom_text_faild_with_lable.dart';
import '../screens/add_game_view_model.dart';

class LocationInPut extends StatelessWidget {
  final AddGameViewModel addGameViewModel;
  const LocationInPut({Key? key, required this.addGameViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFaildWithLable(
      lable: LocaleKeys.Location.tr(),
      hint: LocaleKeys.Location.tr(),
      controller: addGameViewModel.addressController,
      icon: InkWell(
        onTap: () async {
          // showPlacePicker(context);

          const MapScreen().Push(
              context: context,
              type: PageTransitionType.bottomToTop,
              fun: (x) {
                if (x != null) {
                  addGameViewModel.addressController.text = x['address'];
                  addGameViewModel.lat = x['lat'];
                  addGameViewModel.long = x['long'];
                }
              });
        },
        child: Icon(
          Icons.location_on,
          color: AppColor.primery,
        ),
      ),
      readonly: true,
    );
  }
}

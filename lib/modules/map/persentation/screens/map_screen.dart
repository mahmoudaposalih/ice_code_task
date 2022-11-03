import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:ice_code_task/modules/map/persentation/screens/map_view_model.dart';

import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/main_text.dart';
import '../widgets/address_box.dart';
import '../widgets/current_location_icon.dart';
import '../widgets/map_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapViewModel mapViewModel = MapViewModel();

  @override
  void initState() {
    super.initState();

    mapViewModel.getCurrentLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: AppColor.primery,
          ),
        ),
        title: MainText(
          txt: LocaleKeys.Select_game_location.tr(),
          fontFamily: AppFontFamily.Bold,
          size: 17.spi,
          fontColor: AppColor.primery,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              MapWidget(mapViewModel: mapViewModel),
              AdressBox(mapViewModel: mapViewModel),
              CurrentLocationIcon(mapViewModel: mapViewModel)
            ],
          ),
        ),
      ),
    );
  }
}

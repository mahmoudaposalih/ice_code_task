import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../core/luncher_helper.dart';
import '../../../../sharedUi/main_text.dart';
import '../../data/models/game_model.dart';

class GameLocation extends StatelessWidget {
  final GameModel game;
  const GameLocation({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return game.lat == null
        ? Container()
        : InkWell(
            onTap: () {
              LuncherHelper.launchGoogleMaps(
                  lat: game.lat.toString(), long: game.long.toString());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, color: AppColor.primery, size: 20.spi),
                Expanded(
                  child: MainText(
                    txt: game.address,
                    size: 15.spi,
                    height: 1.3,
                    fontFamily: AppFontFamily.SemiBold,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          );
  }
}

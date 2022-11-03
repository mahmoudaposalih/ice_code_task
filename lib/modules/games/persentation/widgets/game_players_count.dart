import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../sharedUi/main_text.dart';

class GamePlayersCount extends StatelessWidget {
  final String maxPlayerCount;
  const GamePlayersCount({Key? key, required this.maxPlayerCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.person, color: AppColor.primery, size: 20.spi),
        MainText(
          txt: maxPlayerCount.toString(),
          size: 15.spi,
          height: 1.3,
          fontFamily: AppFontFamily.SemiBold,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../sharedUi/main_text.dart';

class GameTittel extends StatelessWidget {
  final String tittel;
  const GameTittel({Key? key, required this.tittel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MainText(
        txt: tittel,
        fontFamily: AppFontFamily.Bold,
        size: 18.spi,
        fontColor: AppColor.primery,
      ),
    );
  }
}

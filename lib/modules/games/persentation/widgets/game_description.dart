import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../sharedUi/main_text.dart';

class GameDescription extends StatelessWidget {
  final String descrption;
  const GameDescription({Key? key, required this.descrption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainText(
      txt: descrption,
      fontFamily: AppFontFamily.SemiBold,
      size: 16.spi,
      fontColor: AppColor.primery,
    );
  }
}

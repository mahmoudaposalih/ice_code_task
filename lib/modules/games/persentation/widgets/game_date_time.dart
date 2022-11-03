import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_fonts_family.dart';
import '../../../../sharedUi/main_text.dart';

class GameDateTime extends StatelessWidget {
  final String dateTime;
  const GameDateTime({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainText(
      txt: dateTime,
      size: 13.spi,
      fontFamily: AppFontFamily.Bold,
      fontWeight: FontWeight.w600,
    );
  }
}

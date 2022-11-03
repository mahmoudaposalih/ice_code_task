// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../sharedUi/main_text.dart';
import 'Fillter_icon.dart';
import 'language_icon.dart';

gamesAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColor.white,
    leading: Center(
      child: MainText(
        txt: "Ice - Code",
        fontFamily: AppFontFamily.Bold,
        size: 17.spi,
        fontColor: AppColor.primery,
      ),
    ),
    leadingWidth: 120,
    actions: [
      FillterIcon(),
      SizedBox(
        width: 12,
      ),
      LanguageIcon(),
      SizedBox(
        width: 12,
      ),
    ],
  );
}

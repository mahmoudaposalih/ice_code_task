import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/main_text.dart';

addGameAppBar(BuildContext context) {
  return AppBar(
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
      txt: LocaleKeys.Add_a_new_game.tr(),
      fontFamily: AppFontFamily.Bold,
      size: 17.spi,
      fontColor: AppColor.primery,
    ),
  );
}

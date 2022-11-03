import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/main_text.dart';

class LanguageIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Row(
        children: [
          Icon(
            Icons.language_outlined,
            color: AppColor.primery,
            size: 25.spi,
          ),
          MainText(
            txt: LocaleKeys.lang.tr(),
            size: 15.spi,
            fontFamily: AppFontFamily.SemiBold,
          ),
        ],
      ),
    );
  }
}

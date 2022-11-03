import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/custom_text_faild_with_lable.dart';
import '../screens/add_game_view_model.dart';

class TittelInput extends StatelessWidget {
  final AddGameViewModel addGameViewModel;
  const TittelInput({Key? key, required this.addGameViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFaildWithLable(
      lable: LocaleKeys.Tittel.tr(),
      hint: LocaleKeys.Tittel.tr(),
      controller: addGameViewModel.tittelController,
      required: true,
      validation: (tittel) =>
          tittel!.isEmpty ? LocaleKeys.Please_Enter_tittel.tr() : null,
    );
  }
}

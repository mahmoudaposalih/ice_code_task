// ignore_for_file: file_names
import 'package:easy_localization/easy_localization.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/custom_text_faild_with_lable.dart';
import '../screens/add_game_view_model.dart';
import 'package:flutter/material.dart';

class DescreptionInput extends StatelessWidget {
  final AddGameViewModel addGameViewModel;
  const DescreptionInput({Key? key, required this.addGameViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFaildWithLable(
      lable: LocaleKeys.Description.tr(),
      hint: LocaleKeys.Description.tr(),
      controller: addGameViewModel.descrptionController,
      minliens: 4,
    );
  }
}

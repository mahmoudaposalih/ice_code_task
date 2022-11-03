import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/custom_btn.dart';
import '../screens/add_game_view_model.dart';

class AddBtn extends StatelessWidget {
  final AddGameViewModel addGameViewModel;
  const AddBtn({Key? key, required this.addGameViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBtn(
      txt: LocaleKeys.ADD.tr(),
      fun: () => addGameViewModel.upload(context),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/custom_btn.dart';
import '../screens/add_game_view_model.dart';

class UpdateBtn extends StatelessWidget {
  final String id;
  final AddGameViewModel addGameViewModel;

  const UpdateBtn({Key? key, required this.addGameViewModel, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBtn(
      txt: LocaleKeys.Update.tr(),
      fun: () => addGameViewModel.update(context, id),
    );
  }
}

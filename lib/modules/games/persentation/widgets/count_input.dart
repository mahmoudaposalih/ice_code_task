import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/custom_text_faild_with_lable.dart';
import '../screens/add_game_view_model.dart';

class PlayersCountInPut extends StatelessWidget {
  final AddGameViewModel addGameViewModel;
  const PlayersCountInPut({Key? key, required this.addGameViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFaildWithLable(
      lable: LocaleKeys.Max_Count_Of_Players.tr(),
      hint: LocaleKeys.Max_Count_Of_Players.tr(),
      controller: addGameViewModel.maxCountController,
      validation: (count) => count!.isEmpty
          ? LocaleKeys.Please_Enter_Max_Count_of_Player.tr()
          : !isDouble(count)
              ? LocaleKeys.Please_Enter_valid_Number.tr()
              : double.parse(count) <= 0
                  ? LocaleKeys.Player_count_must_be_greater_than_zero.tr()
                  : null,
      required: true,
      type: TextInputType.number,
    );
  }

  static bool isDouble(String number) {
    try {
      double.parse(number);

      return true;
    } catch (e) {
      return false;
    }
  }
}

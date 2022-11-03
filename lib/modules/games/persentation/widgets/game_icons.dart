import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/luncher_helper.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../cubit/games_cubit.dart';
import '../../data/models/game_model.dart';
import '../screens/add_new_game.dart';

class GameIcons extends StatelessWidget {
  final GameModel game;
  const GameIcons({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              LuncherHelper.share(game.tittel,
                  '${game.descrption!} \n ${game.address!} \n ${getDateTime()}');
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColor.black)),
                child: const Icon(
                  Icons.share,
                  size: 16,
                ))),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                headerAnimationLoop: false,
                animType: AnimType.topSlide,
                showCloseIcon: true,
                closeIcon: const Icon(Icons.close),
                title: LocaleKeys.Warning.tr(),
                desc: LocaleKeys.Are_you_sure_to_delte_game.tr(),
                btnCancelOnPress: () {},
                btnCancelText: LocaleKeys.No.tr(),
                btnOkText: LocaleKeys.yes.tr(),
                onDismissCallback: (type) {},
                btnOkOnPress: () {
                  BlocProvider.of<GamesCubit>(context)
                      .removeProductFromList(game.id);
                },
              ).show();
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColor.black)),
                child: Icon(
                  Icons.delete,
                  color: AppColor.red,
                  size: 16,
                ))),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              AddNewGameScreen(
                game: game,
              ).Push(context: context, type: PageTransitionType.topToBottom);
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColor.black)),
                child: const Icon(
                  Icons.edit_outlined,
                  size: 16,
                ))),
      ],
    );
  }

  getDateTime() {
    var date = game.gameDate;
    return "${date.day}/${date.month}/${date.year}  ${date.hour} : ${date.minute}";
  }
}

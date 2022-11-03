// ignore_for_file: unnecessary_new, unnecessary_const

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:ice_code_task/modules/games/cubit/games_cubit.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import 'package:ice_code_task/sharedUi/custom_btn.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts_family.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/main_text.dart';
import '../../data/models/game_model.dart';
import '../widgets/Fillter_icon.dart';
import '../widgets/Games_List.dart';
import 'add_new_game.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GamesCubit>(context).getGamesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          InkWell(
            onTap: () async {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                headerAnimationLoop: false,
                animType: AnimType.topSlide,
                showCloseIcon: true,
                closeIcon: const Icon(Icons.close),
                title: LocaleKeys.Warning.tr(),
                desc: LocaleKeys.AreYouSureYouWantchangeLanguage.tr(),
                btnCancelOnPress: () {},
                btnCancelText: LocaleKeys.No.tr(),
                btnOkText: LocaleKeys.yes.tr(),
                onDismissCallback: (type) {},
                btnOkOnPress: () async {
                  String lang = context.locale.toString();
                  await context
                      .setLocale(lang == "ar" ? Locale("en") : Locale("ar"));

                  // setState(() {});
                },
              ).show();
            },
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
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Column(
          children: [
            CustomBtn(
              txt: "${LocaleKeys.Add_a_new_game.tr()} +",
              fun: () => AddNewGameScreen()
                  .Push(context: context, type: PageTransitionType.topToBottom),
            ),
            const SizedBox(
              height: 8,
            ),
            GamesList()
          ],
        ),
      ),
    );
  }

  _onBackPressed(context) {
    return showDialog(
        context: context,
        // barrierColor: Colors.white,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: MainText(
              txt: LocaleKeys.AreYouSureYouWantToClose.tr(),
              size: 18,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: MainText(
                  txt: LocaleKeys.No.tr(),
                  size: 15,
                ),
              ),
              TextButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: MainText(
                  txt: LocaleKeys.yes.tr(),
                  size: 15,
                ),
              ),
            ],
          );
        });
  }
}

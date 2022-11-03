import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_code_task/constants/app_colors.dart';
import 'package:ice_code_task/constants/app_fonts_family.dart';
import 'package:ice_code_task/generated/locale_keys.g.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import 'package:sizer/sizer.dart';

import '../../../../const/resource.dart';
import '../../../../sharedUi/lottie.dart';
import '../../../../sharedUi/main_text.dart';
import '../../cubit/games_cubit.dart';
import '../../data/models/game_model.dart';
import 'game_widget.dart';

class GamesList extends StatelessWidget {
  GamesList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesCubit, GamesState>(
      builder: (context, state) {
        switch (state.getGamesStatus) {
          case GetGamesStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case GetGamesStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case GetGamesStatus.success:
            return state.games!.isEmpty
                ? emptyData()
                : _gamesList(
                    state.games!,
                  );
          case GetGamesStatus.failure:
            return MainText(txt: state.exception.toString());
        }
      },
    );
  }

  ScrollController scrollController = ScrollController();
  _gamesList(List<GameModel> games) {
    return Expanded(
      child: ListView.builder(
          itemCount: games.length,
          controller: scrollController,
          itemBuilder: (BuildContext context, index) {
            return GameWidget(
              game: games[index],
            );
          }),
    );
  }

  Widget emptyData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.hi,
        ),
        LottieFile(
          path: R.ASSETS_LOTTIES_EMPTY_JSON,
          width: 90.w,
          higth: 50.h,
        ),
        MainText(
          txt: LocaleKeys.NoAvailbleGames.tr(),
          size: 18.spi,
          fontFamily: AppFontFamily.Bold,
          fontColor: AppColor.primery,
        )
      ],
    );
  }
}

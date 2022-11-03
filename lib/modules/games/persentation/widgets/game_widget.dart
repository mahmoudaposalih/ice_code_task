import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import '../../../../constants/app_colors.dart';
import '../../data/models/game_model.dart';
import 'Game_tittel.dart';
import 'game_date_time.dart';
import 'game_description.dart';
import 'game_icons.dart';
import 'game_image.dart';
import 'game_location.dart';
import 'game_players_count.dart';

class GameWidget extends StatelessWidget {
  final GameModel game;

  const GameWidget({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.wi,
      margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(children: [
        GameImage(
          game: game,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GameTittel(tittel: game.tittel),
                  GameDateTime(
                    dateTime: getDateTime(),
                  )
                ],
              ),
              GameDescription(
                descrption: game.descrption!,
              ),
              const Divider(),
              Column(
                children: [
                  GameLocation(
                    game: game,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GamePlayersCount(
                          maxPlayerCount:
                              game.maxPlayerCount.toInt().toString()),
                      GameIcons(
                        game: game,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  getDateTime() {
    var date = game.gameDate;
    return "${date.day}/${date.month}/${date.year}  ${date.hour} : ${date.minute}";
  }
}

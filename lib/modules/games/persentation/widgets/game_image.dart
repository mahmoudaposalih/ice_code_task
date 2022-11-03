import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../data/models/game_model.dart';

class GameImage extends StatelessWidget {
  final GameModel game;
  const GameImage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return game.image == null
        ? Container()
        : ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.asset(
              game.image!,
              height: 180.hi,
              width: 375.hi,
              fit: BoxFit.cover,
            ));
  }
}

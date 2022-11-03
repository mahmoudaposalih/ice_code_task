import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_code_task/generated/locale_keys.g.dart';

import 'package:ice_code_task/modules/games/cubit/games_cubit.dart';

import '../../../../sharedUi/show_toast.dart';
import '../../data/models/game_model.dart';

class AddGameViewModel {
  final TextEditingController tittelController = TextEditingController();
  final TextEditingController descrptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController maxCountController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  String? selectedImage;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double? lat;
  double? long;
  DateTime? selectedDateTime;

  upload(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState?.validate() ?? false) {
      BlocProvider.of<GamesCubit>(context)
          .addGametoList(GameModel(
              gameDate: selectedDateTime!,
              maxPlayerCount: double.parse(maxCountController.text),
              tittel: tittelController.text,
              address: addressController.text,
              descrption: descrptionController.text,
              image: selectedImage,
              lat: lat,
              long: long,
              id: DateTime.now().microsecondsSinceEpoch.toString()))
          .then((value) {
        if (value == true) {
          showToast(LocaleKeys.The_game_has_been_added_successfully.tr(),
              context, true);
          // BlocProvider.of<GamesCubit>(context).getGamesList();
        } else {
          showToast(value.toString(), context, true);
        }
      });
    }
  }

  update(BuildContext context, String id) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState?.validate() ?? false) {
      BlocProvider.of<GamesCubit>(context)
          .updateGameinList(
              id,
              GameModel(
                  gameDate: selectedDateTime!,
                  maxPlayerCount: double.parse(maxCountController.text),
                  tittel: tittelController.text,
                  address: addressController.text,
                  descrption: descrptionController.text,
                  image: selectedImage,
                  lat: lat,
                  long: long,
                  id: id))
          .then((value) {
        if (value == true) {
          showToast(LocaleKeys.The_game_has_been_modified_successfully.tr(),
              context, true);
          // BlocProvider.of<GamesCubit>(context).getGamesList();
        } else {
          showToast(value.toString(), context, true);
        }
      });
    }
  }

  GameModel? gamemodel;
  void init(GameModel? game) {
    if (game != null) {
      gamemodel = game;
      addressController.text = game.address ?? "";
      selectedImage = game.image;
      tittelController.text = game.tittel;
      descrptionController.text = game.descrption ?? "";
      maxCountController.text = game.maxPlayerCount.toString();
      dateTimeController.text = getDateTime(game.gameDate);
      selectedDateTime = game.gameDate;
      lat = game.lat;
      long = game.long;
    }
  }

  getDateTime(DateTime date) {
    return "${date.day}/${date.month}/${date.year}  ${date.hour} : ${date.minute}";
  }
}

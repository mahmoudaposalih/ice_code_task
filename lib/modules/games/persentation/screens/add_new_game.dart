import 'package:flutter/material.dart';

import 'package:ice_code_task/constants/app_colors.dart';
import 'package:ice_code_task/modules/games/persentation/screens/add_game_view_model.dart';
import 'package:ice_code_task/modules/games/persentation/widgets/update_btn.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../data/models/game_model.dart';
import '../widgets/add_btn.dart';
import '../widgets/add_game_app_bar.dart';
import '../widgets/count_input.dart';
import '../widgets/date_time_input.dart';
import '../widgets/descreption_Input.dart';
import '../widgets/location_input.dart';
import '../widgets/pick_image.dart';
import '../widgets/tittel_input.dart';

class AddNewGameScreen extends StatefulWidget {
  final GameModel? game;

  AddNewGameScreen({Key? key, this.game}) : super(key: key);

  @override
  State<AddNewGameScreen> createState() => _AddNewGameScreenState();
}

class _AddNewGameScreenState extends State<AddNewGameScreen> {
  AddGameViewModel viewModel = AddGameViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.init(widget.game);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: addGameAppBar(context),
      body: Form(
        key: viewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              PickImage(addGameViewModel: viewModel),
              TittelInput(addGameViewModel: viewModel),
              DescreptionInput(addGameViewModel: viewModel),
              PlayersCountInPut(addGameViewModel: viewModel),
              DateTimeInput(addGameViewModel: viewModel),
              LocationInPut(addGameViewModel: viewModel),
              SizedBox(
                height: 15.hi,
              ),
              viewModel.gamemodel == null
                  ? AddBtn(addGameViewModel: viewModel)
                  : UpdateBtn(addGameViewModel: viewModel, id: widget.game!.id),
              SizedBox(
                height: 15.hi,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

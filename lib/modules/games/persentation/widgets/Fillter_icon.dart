// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';

import '../../../../constants/app_colors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/custom_btn.dart';
import '../../cubit/games_cubit.dart';

class FillterIcon extends StatelessWidget {
  const FillterIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        modalBottomSheetMenu(context);
      },
      child: Icon(
        Icons.filter_list_alt,
        color: AppColor.primery,
        size: 25.spi,
      ),
    );
  }

  void modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 140.wi,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomBtn(
                        txt: LocaleKeys.Sory_by_data.tr(),
                        fontsize: 12.spi,
                        fun: () {
                          BlocProvider.of<GamesCubit>(context)
                              .sortGamesListByData();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140.wi,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomBtn(
                        padding: 15,
                        fontsize: 12.spi,
                        txt: LocaleKeys.Sort_By_Tittel.tr(),
                        fun: () {
                          BlocProvider.of<GamesCubit>(context)
                              .sortGamesListByTittel();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}

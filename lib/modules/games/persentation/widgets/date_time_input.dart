import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../constants/app_colors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/custom_text_faild_with_lable.dart';
import '../screens/add_game_view_model.dart';

class DateTimeInput extends StatelessWidget {
  final AddGameViewModel addGameViewModel;
  const DateTimeInput({Key? key, required this.addGameViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFaildWithLable(
      lable: LocaleKeys.Date_Time.tr(),
      hint: LocaleKeys.Date_Time.tr(),
      controller: addGameViewModel.dateTimeController,
      validation: (date) =>
          date!.isEmpty ? LocaleKeys.Please_Enter_DateTime.tr() : null,
      icon: InkWell(
        onTap: () {
          DatePicker.showDateTimePicker(context,
              showTitleActions: true,
              minTime: DateTime(1990, 5, 5, 20, 50),
              maxTime: DateTime(2050, 6, 7, 05, 09),
              onChanged: (date) {}, onConfirm: (date) {
            addGameViewModel.dateTimeController.text = getDateTime(date);
            addGameViewModel.selectedDateTime = date;
          },
              locale: context.locale.toString() == "ar"
                  ? LocaleType.ar
                  : LocaleType.en);
        },
        child: Icon(
          Icons.calendar_month_outlined,
          color: AppColor.primery,
        ),
      ),
      readonly: true,
      required: true,
    );
  }

  getDateTime(DateTime date) {
    return "${date.day}/${date.month}/${date.year}  ${date.hour} : ${date.minute}";
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ice_code_task/constants/app_colors.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/app_fonts_family.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../sharedUi/images_widgets.dart';
import '../../../../sharedUi/main_text.dart';
import '../screens/add_game_view_model.dart';

class PickImage extends StatefulWidget {
  final AddGameViewModel addGameViewModel;
  const PickImage({Key? key, required this.addGameViewModel}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  String? selectedIamge;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            txt: LocaleKeys.Image.tr(),
            size: 11.sp,
            fontColor: AppColor.primery,
            fontFamily: AppFontFamily.Bold,

            // bold: true,
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () => const ImagesWidget().Push(
                context: context,
                type: PageTransitionType.leftToRight,
                fun: (x) => setState(() {
                      if (x != null) {
                        widget.addGameViewModel.selectedImage = x["image"];
                      }
                    })),
            child: Container(
              // width: 100.h,
              height: 142.hi,
              width: 90.w,
              child: widget.addGameViewModel.selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.addGameViewModel.selectedImage!,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(
                            Icons.image_outlined,
                            size: 30.sp,
                            color: AppColor.black,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.add,
                                  color: AppColor.black,
                                  size: 15.sp,
                                ),
                                // padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    border: Border.all(
                                        width: .7, color: AppColor.black),
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              MainText(
                                txt: LocaleKeys.Add_Game_main_image.tr(),
                                fontColor: AppColor.black,
                                fontFamily: AppFontFamily.Medium,
                                size: 12.sp,
                              )
                            ],
                          )
                        ]),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: AppColor.primery)),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

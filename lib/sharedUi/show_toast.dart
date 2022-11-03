import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts_family.dart';
import 'main_text.dart';

showToast(String text, BuildContext context, bool success) {
  FToast fToast = FToast();
  fToast.init(context);
  return fToast.showToast(
    child: Container(
      // width: 50.w,
      margin: const EdgeInsets.only(bottom: 30),
      height: 60,
      alignment: Alignment.center,

      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: success ? AppColor.second : AppColor.red),
      child: MainText(
        txt: text.toString(),
        fontColor: AppColor.white,
        fontFamily: AppFontFamily.Medium,
        textAlign: TextAlign.center,
        size: 12.sp,
      ),
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

// ignore_for_file: non_constant_identifier_names, file_names
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts_family.dart';
import 'main_text.dart';

class CustomBtn extends StatelessWidget {
  final String? txt;
  final Function? fun;
  final Color? BackgroundColor;
  final Color? txtColor;
  final double? fontsize;
  final double? reduis;
  final Color? borderColor;
  final Widget? widget;
  final double? padding;

  const CustomBtn(
      {Key? key,
      this.txt,
      this.fun,
      this.BackgroundColor,
      this.txtColor,
      this.padding,
      this.widget,
      this.reduis,
      this.fontsize,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => fun!(),
      child: Container(
        width: .9.w * 100,
        padding: EdgeInsets.symmetric(vertical: padding ?? 12),
        alignment: Alignment.center,
        child: widget ??
            MainText(
              txt: txt ?? "",
              size: fontsize ?? 13.sp,
              fontColor: txtColor ?? Colors.white,
              textAlign: TextAlign.center,
              height: 1,
              fontFamily: AppFontFamily.Medium,
            ),
        decoration: BoxDecoration(
            color: BackgroundColor ?? AppColor.primery,
            borderRadius: BorderRadius.circular(reduis ?? 8),
            border:
                Border.all(width: 1.3, color: borderColor ?? AppColor.primery)),
      ),
    );
  }
}

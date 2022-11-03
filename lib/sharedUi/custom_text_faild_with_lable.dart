import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

// import 'package:helpcar/persnation/sharedUI/MainTextBold.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts_family.dart';
import 'custom_text_faild.dart';
import 'main_text.dart';

class TextFaildWithLable extends StatelessWidget {
  final String? lable;
  final String? hint;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? ispassword;
  final Widget? prefix;
  final TextInputType? type;
  final int? minliens;
  final bool? readonly;
  final String? Function(String?)? validation;
  final bool? required;

  const TextFaildWithLable(
      {Key? key,
      required this.lable,
      required this.hint,
      required this.controller,
      this.icon,
      this.required,
      this.ispassword,
      this.prefix,
      this.validation,
      this.type,
      this.minliens,
      this.readonly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Row(
              children: [
                MainText(
                  txt: lable!,
                  size: 11.sp,
                  fontColor: AppColor.primery,
                  fontFamily: AppFontFamily.Bold,

                  // bold: true,
                ),
                MainText(
                  txt: (required != true ? " " : " * "),
                  size: 11.sp,
                  fontColor: AppColor.red,
                  fontFamily: AppFontFamily.Bold,

                  // bold: true,
                ),
              ],
            ),
          ),
          Center(
            child: CustomTextFaild(
              controller: controller,
              hintTxt: hint,
              Icon: icon,
              password: ispassword,
              prefix: prefix,
              validation: validation,
              type: type,
              minliens: minliens,
              readonly: readonly,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts_family.dart';

class MainText extends StatelessWidget {
  final String? txt;
  final double? size;
  final Color? fontColor;
  final bool? linethrougth;
  final String? fontFamily;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final bool? underLine;
  final FontWeight? fontWeight;

  const MainText(
      {Key? key,
      this.txt,
      this.size,
      this.fontColor,
      this.textAlign,
      this.underLine,
      this.linethrougth,
      this.fontWeight,
      this.fontFamily,
      this.textOverflow,
      this.height,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt ?? "-",
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 1000,
      style: TextStyle(
          decoration: linethrougth != null
              ? TextDecoration.lineThrough
              : underLine == true
                  ? TextDecoration.underline
                  : TextDecoration.none,
          decorationThickness: 1,
          fontFamily: fontFamily ?? AppFontFamily.Regular,
          fontSize: size != null ? (size! - (1.spi)) : 10,
          height: height ?? 1.5,
          color: fontColor ?? AppColor.black,
          fontWeight: fontWeight,
          overflow: textOverflow),
    );
  }
}
/***
 
        Clipboard.setData(ClipboardData(text: txt));
        ScaffoldMessenger.of(context)
            .h*100owSnackBar(SnackBar(content: Text("$txt copied to clipboard")));
 */
import 'package:flutter/material.dart';

class AppColor {
  static Color primery = HexColor("#2F1772");

  static Color second = HexColor("#C8F17B");
  static Color blue = HexColor("#0000FF");
  static Color red = HexColor("#FF696A");
  static Color black = HexColor("#2D2E4A");
  static Color white = HexColor("#FFFFFF");
  static Color hint = HexColor("#777777");
  static Color green = HexColor("#49D90C");
  static Color shadow = HexColor("#49D90C");
  static Color primairyHint = HexColor("#E7F0FF");
  static Color yello = HexColor("#FFBE00");
  static Color copunRed = HexColor("#FF696A");
  static Color copunyello = HexColor("#FFBE00");
  static Color lightGrey = const Color.fromRGBO(224, 224, 224, 1);
  static Color grey100 = const Color.fromRGBO(245, 245, 245, 1);
  static Color shimmerBaseColor = Colors.grey.withOpacity(.2);
  static Color shimmerHighLightColor = Colors.grey.withOpacity(.7);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

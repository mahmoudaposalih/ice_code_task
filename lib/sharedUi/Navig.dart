// ignore_for_file: camel_case_extensions
// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';

import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

extension sizePercentage on num {
  double get hi => ((this / 811) * 100).h;

  double get wi => ((this / 375) * 100).w;
  double get spi => (hi + wi) / 2;
}

extension NavigationScreens on Widget {
  Push(
      {required BuildContext context,
      required PageTransitionType type,
      // @required Widget Destination,
      int? duration,
      Function(dynamic)? fun,
      Widget? Current}) {
    Navigator.push(
            context,
            PageTransition(
                type: type,
                duration: Duration(milliseconds: duration ?? 500),
                child: this,
                childCurrent: Current ?? context.widget,
                alignment: Alignment.center))
        .then((value) => fun!(value));
  }

  PushAndReplace(
      {required BuildContext context,
      required PageTransitionType type,
      // @required Widget Destination,
      int? duration,
      Widget? Current}) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            type: type,
            alignment: Alignment.center,
            duration: Duration(milliseconds: duration ?? 500),
            child: this,
            childCurrent: Current ?? context.widget),
        (route) => false);
  }
}

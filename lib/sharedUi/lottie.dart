import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieFile extends StatelessWidget {
  final String path;
  final double width;
  final double higth;

  const LottieFile(
      {Key? key, required this.path, this.higth = 50, this.width = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(path, width: width, height: higth, fit: BoxFit.fill),
    );
  }
}

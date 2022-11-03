import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ice_code_task/modules/games/persentation/screens/games.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../const/resource.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => const GamesScreen()
            .Push(context: context, type: PageTransitionType.leftToRight));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(R.ASSETS_IMAGES_APPICON_PNG)),
    );
  }
}

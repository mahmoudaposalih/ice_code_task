import 'package:flutter/material.dart';
import 'package:ice_code_task/constants/app_colors.dart';
import 'package:ice_code_task/demo_data.dart';
import 'package:ice_code_task/sharedUi/Navig.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_fonts_family.dart';
import 'main_text.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.white,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: AppColor.primery,
            ),
          ),
          title: MainText(
            txt: "Images",
            fontFamily: AppFontFamily.Bold,
            size: 17.spi,
            fontColor: AppColor.primery,
          ),
        ),
        body: SingleChildScrollView(
          child: Wrap(
            children: List.generate(
                images.length,
                (index) => InkWell(
                      onTap: () =>
                          Navigator.pop(context, {"image": images[index]}),
                      child: Image.asset(
                        images[index],
                        width: 50.w,
                        height: 30.h,
                        fit: BoxFit.cover,
                      ),
                    )),
          ),
        ));
  }
}

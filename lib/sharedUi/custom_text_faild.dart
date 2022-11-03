// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, implementation_imports
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as intl;
import 'package:easy_localization/src/public_ext.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts_family.dart';

class CustomTextFaild extends StatefulWidget {
  final Widget? Icon;
  final TextEditingController? controller;
  final String? hintTxt;
  final bool? password;
  final double? hintsize;
  final int? minliens;
  final bool? readonly;
  final Widget? prefix;
  final TextInputType? type;
  final String? Function(String?)? validation;
  final Function(String?)? search;
  final Color? Background;

  final TextInputAction? textInputAction;
  const CustomTextFaild(
      {Key? key,
      this.Icon,
      required this.controller,
      required this.hintTxt,
      this.password,
      this.hintsize,
      this.minliens,
      this.search,
      this.textInputAction,
      this.Background,
      this.type,
      this.readonly,
      this.prefix,
      this.validation})
      : super(key: key);

  @override
  State<CustomTextFaild> createState() => _CustomTextFaildState();
}

class _CustomTextFaildState extends State<CustomTextFaild> {
  String? lang;
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  String? text;
  @override
  Widget build(BuildContext context) {
    lang = context.locale.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: TextFormField(
          cursorColor: AppColor.primery,
          controller: widget.controller,
          obscureText: widget.password ?? false,
          minLines: widget.minliens ?? 1,
          maxLines: widget.minliens ?? 1,
          textDirection: text == null && lang == "ar"
              ? TextDirection.rtl
              : text == null && lang == "en"
                  ? TextDirection.ltr
                  : isRTL(text ?? "")
                      ? TextDirection.rtl
                      : TextDirection.ltr,
          keyboardType: widget.type ?? TextInputType.text,
          validator: widget.validation,
          autovalidateMode: AutovalidateMode.disabled,
          readOnly: widget.readonly ?? false,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (txt) {
            if (widget.textInputAction == TextInputAction.search) {
              widget.search!(txt);
            }
          },
          onChanged: (value) {
            setState(() {
              text = value;
            });
          },
          style: TextStyle(
              fontFamily: AppFontFamily.Medium,
              fontSize: widget.hintsize ?? 12,
              color: Colors.black),
          decoration: InputDecoration(
              errorStyle: TextStyle(
                  fontFamily: AppFontFamily.Bold,
                  fontSize: 12,
                  color: Colors.red[900]),
              contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.primery, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColor.primery,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColor.primery,
                    width: 1,
                  )),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: AppFontFamily.Medium,
                fontSize: widget.hintsize ?? 10,
              ),
              hintText: "   " + widget.hintTxt.toString() + "   ",
              // hintText: this.hintTxt ?? "",
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColor.red,
                    width: 1,
                  )),
              fillColor: Colors.white70,
              suffixIcon: widget.Icon,
              prefixIcon: widget.prefix),
        ),
      ),
    );
  }
}

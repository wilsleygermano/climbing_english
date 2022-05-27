import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CustomDialog(
  BuildContext customcontext,
  String titleText,
  String contentText,
  String buttonText,
  Function()? onpressed,
) {
  return showDialog(
    context: customcontext,
    builder: (context) => AlertDialog(
      title: Text(
        titleText,
        style: AppFonts.appfont16.copyWith(
          color: AppColors.maincolor3,
        ),
      ),
      content: Text(
        contentText,
        style: AppFonts.appfont16.copyWith(
          color: AppColors.maincolor3,
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: onpressed,
          child: Text(
            buttonText,
            style: AppFonts.appfont16.copyWith(
          color: AppColors.maincolor3,
            ),
          ),
        )
      ],
    ),
  );
}
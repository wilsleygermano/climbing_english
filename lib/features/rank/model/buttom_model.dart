import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/app_fonts.dart';
import 'package:flutter/material.dart';

class ButtomModel extends StatelessWidget {
final String text;
  final Function() onPressed;


  const ButtomModel({ Key? key, required this.onPressed, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(9)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 30,
          width: 120,
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppFonts.textfont18.copyWith(color: AppColors.textcolor, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)
          ),
        ),
      ),
    );
  }
}
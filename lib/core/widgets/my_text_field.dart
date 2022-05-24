import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final Function(String) textController;
  final String hintText;
  final Icon icon;

  final TextInputAction textInputActionField;

  const MyTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    required this.textInputActionField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      onChanged: textController,
      textInputAction: textInputActionField,
      style: TextStyle(
        color: AppColors.maincolor1,
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: AppColors.maincolor1,
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 20,
        ),
        hintText: hintText,
        suffixIcon: Icon(
          Icons.abc_outlined,
          color: Colors.transparent,
        ),
        prefixIcon: icon,
        focusColor: AppColors.maincolor1,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.maincolor3,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.maincolor3,
          ),
        ),
      ),
    );
  }
}

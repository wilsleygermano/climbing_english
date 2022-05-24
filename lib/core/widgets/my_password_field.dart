import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyPasswordField extends StatelessWidget {
  final Function(String) textController;
  final String hintText;
  final Icon icon;
  final TextInputAction textInputActionField;
  final bool isPasswordVisible;
  final IconButton sufixIcon;


  const MyPasswordField(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.icon,
      required this.textInputActionField,
      required this.isPasswordVisible,
      required this.sufixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      obscureText: isPasswordVisible,
      onChanged: textController,
      textInputAction: textInputActionField,
      style: TextStyle(
        color: HexColor("A1B5D8"),
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: HexColor("A1B5D8"),
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 20,
        ),
        hintText: hintText,
        suffixIcon: sufixIcon,
        prefixIcon: icon,
        focusColor: HexColor("A1B5D8"),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor("738290"),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: HexColor("738290"),
          ),
        ),
      ),
    );
  }
}

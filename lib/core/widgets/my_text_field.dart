import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
      onChanged: textController,
      textInputAction: textInputActionField,
      style: TextStyle(
        color: HexColor("A1B5D8"),
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        prefixIconColor: HexColor("A1B5D8"),
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

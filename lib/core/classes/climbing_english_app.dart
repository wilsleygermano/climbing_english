import 'package:climbing_english/features/login/view/login_page.dart';
import 'package:climbing_english/features/register/view/register_page.dart';
import 'package:climbing_english/features/splash/view/splash_page.dart';
import 'package:flutter/material.dart';


class ClimbingEnglishApp extends StatelessWidget {
  const ClimbingEnglishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: RegisterPage(),

    );
  }
}
import 'package:climbing_english/features/splash/view/splash_page.dart';
import 'package:flutter/material.dart';


class ClimbingEnglishApp extends StatelessWidget {
  const ClimbingEnglishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: SplashPage(),

    );
  }
}
import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {

  final _controller = SplashController();
  
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.maincolor2,
      body: Center(
        child: Observer(builder: (_) {
          widget._controller.checkIfUserIsLoggedIn(context);
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Lottie.asset("lib/assets/splash.image.json"),
          );
        },),
      ),
    );
  }
}

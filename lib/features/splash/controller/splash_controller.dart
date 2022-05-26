import 'package:climbing_english/features/home/view/my_home_page.dart';
import 'package:climbing_english/features/login/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

 

  @action
  Future checkIfUserIsLoggedIn(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
   FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          );
          return;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }
      },
    );
  }
}

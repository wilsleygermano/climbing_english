import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Container(
        width: 272,
        height: 220,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/logo.png"), fit: BoxFit.fill),
        ),
      ),
    );
  }
}

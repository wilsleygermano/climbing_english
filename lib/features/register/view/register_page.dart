import 'dart:math';

import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/app_fonts.dart';
import 'package:climbing_english/core/widgets/my_text_field.dart';
import 'package:climbing_english/features/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterPage extends StatelessWidget {
  final _controller = RegisterController();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.maincolor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 53),
                  child: Container(
                    height: 220,
                    width: 272,
                    child: Hero(
                      tag: "climbing-english",
                      child: Image(image: AssetImage("lib/assets/logo.png")),
                    ),
                  ),
                ),
                Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30, left: 21, right: 21),
                    child: MyTextField(
                        textController: _controller.changeEmail,
                        hintText: "E-mail",
                        icon: Icon(Icons.email),
                        textInputActionField: TextInputAction.next),
                  );
                }),
                Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30, left: 21, right: 21),
                    child: MyTextField(
                        textController: _controller.changePassword,
                        hintText: "Password",
                        icon: Icon(Icons.visibility),
                        textInputActionField: TextInputAction.next),
                  );
                }),
                Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30, left: 21, right: 21),
                    child: MyTextField(
                        textController: _controller.changePasswordConfirmation,
                        hintText: "Confirm Password",
                        icon: Icon(Icons.visibility),
                        textInputActionField: TextInputAction.done),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(right: 131, left: 131, top: 68),
                  child: Container(
                      height: 48,
                      width: 128,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: Observer(builder: (_) {
                        return ElevatedButton(
                            child: Text("CREATE", style: AppFonts.appfont24,),
                            onPressed: _controller.createUser,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.maincolor3)));
                      })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

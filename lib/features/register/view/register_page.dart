import 'dart:math';

import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/app_fonts.dart';
import 'package:climbing_english/core/widgets/custom_dialog.dart';
import 'package:climbing_english/core/widgets/my_password_field.dart';
import 'package:climbing_english/core/widgets/my_text_field.dart';
import 'package:climbing_english/features/home/view/my_home_page.dart';
import 'package:climbing_english/features/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

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
                    padding:
                        const EdgeInsets.only(top: 30, left: 21, right: 21),
                    child: MyTextField(
                        textController: _controller.changeEmail,
                        hintText: "E-mail",
                        icon: Icon(
                          Icons.email,
                          color: AppColors.maincolor1,
                        ),
                        textInputActionField: TextInputAction.next),
                  );
                }),
                Observer(builder: (_) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 21, right: 21),
                    child: MyPasswordField(
                      textController: _controller.changePassword,
                      hintText: "Password",
                      icon: Icon(
                        Icons.key,
                        color: AppColors.maincolor1,
                      ),
                      textInputActionField: TextInputAction.next,
                      isPasswordVisible: _controller.isPasswordVisible,
                      sufixIcon: IconButton(
                          icon: _controller.isPasswordVisible
                              ? Icon(
                                  Icons.visibility,
                                  color: AppColors.maincolor1,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: AppColors.maincolor1,
                                ),
                          onPressed: _controller.setPasswordVisibility),
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 21, right: 21),
                    child: MyPasswordField(
                      textController: _controller.changePasswordConfirmation,
                      hintText: "Confirm Password",
                      icon: Icon(
                        Icons.key,
                        color: AppColors.maincolor1,
                      ),
                      textInputActionField: TextInputAction.done,
                      isPasswordVisible:
                          _controller.isPasswordConfirmationVisible,
                      sufixIcon: IconButton(
                        icon: _controller.isPasswordConfirmationVisible
                            ? Icon(
                                Icons.visibility,
                                color: AppColors.maincolor1,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: AppColors.maincolor1,
                              ),
                        onPressed:
                            _controller.setPasswordConfirmationVisibility,
                      ),
                    ),
                  );
                }),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 131, left: 131, top: 68),
                  child: Container(
                      height: 48,
                      width: 128,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Observer(builder: (_) {
                        bool isLoading = _controller.isButtonAtLoadingState;
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: isLoading
                                ? AppColors.maincolor3
                                : _controller.areCredentialsValid
                                    ? AppColors.maincolor3
                                    : AppColors.maincolor1,
                          ),
                          onPressed: _controller.areCredentialsValid
                              ? () async {
                                  _controller.setButtonToLoadingState();
                                  await _controller.createUser();
                                  if (_controller.areCredentialsValid ==
                                      false) {
                                    await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CustomDialog(
                                                  context,
                                                  "Error!",
                                                  "Complete your Data",
                                                  "OK", () {
                                                Navigator.pop(context);
                                              });
                                            })
                                        .then((_) => _controller
                                            .isButtonAtLoadingState = false);
                                  }

                                  if (_controller.areCredentialsValid == true) {
                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyHomePage(),
                                      ),
                                    );
                                  }
                                }
                              : null,
                          child: isLoading
                              ? Container(
                                  color: AppColors.maincolor3,
                                  width: 60,
                                  height: 60,
                                  child: Lottie.asset(
                                      "lib/assets/loading.book.json"))
                              : Text(
                                  _controller.areCredentialsValid
                                      ? "CREATE"
                                      : "CREATE",
                                  style: AppFonts.appfont20
                                      .copyWith(color: AppColors.maincolor2),
                                  textAlign: TextAlign.center,
                                ),
                        );
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

import 'dart:math';

import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/app_fonts.dart';
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
                        icon: Icon(Icons.email),
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
                      icon: Icon(Icons.key),
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
                        onPressed: _controller.setPasswordVisibility,
                      ),
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
                      icon: Icon(Icons.key),
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
                          onPressed: _controller.areCredentialsValid
                              ? () async {
                                  _controller.setButtonToLoadingState();
                                  final resource =
                                      await _controller.createUser();
                                  if (_controller.areCredentialsValid ==
                                      false) {
                                    await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                backgroundColor:
                                                    AppColors.maincolor3,
                                                child:
                                                    Text("Invalid Credentials"),
                                              );
                                            })
                                        .then((_) => _controller
                                            .isButtonAtLoadingState = false);
                                  }

                                  if (_controller.areCredentialsValid == true) {
                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyHomePage(title: "Hello"),
                                      ),
                                    );
                                  }
                                }
                              : null,
                          child: isLoading
                              ? Container(
                                  width: 24,
                                  height: 24,
                                  child: Lottie.network(
                                      "https://assets10.lottiefiles.com/packages/lf20_wh5alaq6.json"))
                              : Text(_controller.areCredentialsValid
                                  ? "CREATE"
                                  : "Invalid Credentials"),
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

import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/my_password_field.dart';
import 'package:climbing_english/core/widgets/my_text_field.dart';
import 'package:climbing_english/features/home/view/my_home_page.dart';
import 'package:climbing_english/features/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatelessWidget {
  final _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.maincolor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 53),
                  child: Container(
                    width: 272,
                    height: 220,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/assets/logo.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21, right: 21, top: 68),
                  child: Observer(builder: (_) {
                    return MyTextField(
                      textController: _controller.changeEmail,
                      hintText: "E-mail",
                      icon: Icon(
                        Icons.alternate_email,
                        color: AppColors.maincolor1,
                      ),
                      textInputActionField: TextInputAction.next,
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21, right: 21, top: 68),
                  child: Observer(
                    builder: (_) {
                      return MyPasswordField(
                        isPasswordVisible: !_controller.isPasswordVisible,
                        textController: _controller.changePassword,
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
                        hintText: "Password",
                        icon: Icon(
                          Icons.key,
                          color: AppColors.maincolor1,
                        ),
                        textInputActionField: TextInputAction.done,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 68.0),
                  child: Container(
                    height: 48,
                    width: 128,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Observer(
                      builder: (_) {
                        return ElevatedButton(
                          onPressed: () async {
                            await _controller.loginUser(context);
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontSize: 24,
                              color: AppColors.maincolor2,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppColors.maincolor3,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Need an account? Sign Up",
                      style: TextStyle(
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 18,
                        color: AppColors.maincolor1,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

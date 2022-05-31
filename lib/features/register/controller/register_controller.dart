import 'package:climbing_english/features/register/view/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/widgets/custom_dialog.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  @observable
  String email = "";

  @action
  void changeEmail(String newValue) => email = newValue;

  @computed
  bool get isEmailValid =>
      email.contains("@") && email.contains(".com") && email.isNotEmpty;

  @observable
  String password = "";

  @action
  void changePassword(String newValue) => password = newValue;

  @computed
  bool get isPasswordValid => password.length > 4;

  @observable
  String passwordConfirmation = "";

  @action
  void changePasswordConfirmation(String newValue) =>
      passwordConfirmation = newValue;

  @computed
  bool get isPasswordConfirmationValid => passwordConfirmation == password;

  @observable
  bool isPasswordVisible = true;

  @action
  void setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  bool isPasswordConfirmationVisible = true;

  @action
  void setPasswordConfirmationVisibility() =>
      isPasswordConfirmationVisible = !isPasswordConfirmationVisible;

  @observable
  bool isButtonAtLoadingState = false;

  @action
  void setButtonToLoadingState() => isButtonAtLoadingState = true;

  @computed
  bool get areCredentialsValid =>
      isEmailValid && isPasswordValid && isPasswordConfirmationValid;

  @action
  Future createUser(BuildContext context) async {
    setButtonToLoadingState();
    await Future.delayed(Duration(seconds: 2));
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return CustomDialog(
          context,
          "Error",
          "Weak Password",
          "OK",
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage(),
            ),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        return CustomDialog(
            context,
            "Error",
            "The account already exists for that email.",
            "OK",
            () => Navigator.pop(context));
      }
    }
  }
}

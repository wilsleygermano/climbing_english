import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email = "";

  @action
  void changeEmail(String newEmail) {
    email = newEmail;
  }

  @observable
  String password = "";

  @action
  void changePassword(String newPassword) {
    password = newPassword;
  }

  @computed
  bool get areCredentialsValid => password.isNotEmpty && email.contains("@");

  @observable
  bool isPasswordVisible = false;

  @action
  void setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @action
  Future loginUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
          print("Deu tudo certo");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

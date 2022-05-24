import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
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
  bool get isPasswordValid => password.length > 6;

  @observable
  String passwordConfirmation = "";

  @action
  void changePasswordConfirmation(String newValue) =>
      passwordConfirmation = newValue;

  @computed
  bool get isPasswordConfirmationValid => passwordConfirmation == password;

  @observable
  bool isPasswordVisible = false;

  @action
  void setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  bool isPasswordConfirmationVisible = false;

  @action
  void setPasswordConfirmationVisibility() =>
      isPasswordConfirmationVisible = !isPasswordConfirmationVisible;

  @action
  Future createUser() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Deu tudo certo");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }
}

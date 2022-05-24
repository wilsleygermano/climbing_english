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
    email = newPassword;
  }

  @computed
  bool get areCredentialsValid => password.isNotEmpty && email.contains("@");

  @observable
  bool isPasswordVisible = false;

  @action
  void setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;
}

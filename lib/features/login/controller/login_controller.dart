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

  @computed
  bool get isEmailValid => email.contains("@");

  @observable
  String password = "";

  @action
  void changePassword(String newPassword) {
    email = newPassword;
  }

  @computed
  bool get isPasswordValid => password.isNotEmpty;
}

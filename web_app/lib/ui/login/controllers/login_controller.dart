import 'package:core/core.dart';
import 'package:domain/domain.dart';

class LoginController extends BaseController {
  String email = '';
  String password = '';
  final LoginUseCase _loginUseCase;

  LoginController(this._loginUseCase);

  void onEmailChanged(String email) {
    this.email = email;
  }

  void onPasswordChanged(String password) {
    this.password = password;
  }

  Future<void> login() async {
    launchUseCase(_loginUseCase(email: email, password: password));
  }
}

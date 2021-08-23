import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../routes/app_routes.dart';

@Injectable()
class LoginController extends BaseController {
  String email = '';
  String password = '';
  final LoginUseCase _loginUseCase;
  final GetHasLoginUseCase _getHasLoginUseCase;

  LoginController(
    this._loginUseCase,
    this._getHasLoginUseCase,
  ) {
    email+='1';
    print('email $email ${hashCode}');
  }

  @override
  void onReady() {
    super.onReady();
    if (_getHasLoginUseCase()) {
      _navigateToHome();
    }
  }

  void onEmailChanged(String email) {
    this.email = email;
  }

  void onPasswordChanged(String password) {
    this.password = password;
  }

  Future<void> login() async {
    await launchUseCase(
      _loginUseCase(email: email, password: password),
      doOnSuccess: (_) => _navigateToHome(),
    );
  }

  void _navigateToHome() {
    Get.offAllNamed(AppRoutes.home);
  }
}

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../routes/app_routes.dart';

@Injectable()
class HomeController extends BaseController {
  final GetHasLoginUseCase _getHasLoginUseCase;

  HomeController(
    this._getHasLoginUseCase,
  );

  @override
  void onReady() {
    super.onReady();
    if (!_getHasLoginUseCase()) {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}

import 'package:get/get.dart';

import '../domain.dart';

class UseCaseModule extends Bindings {
  @override
  void dependencies() {
    Get.create(() => IsDarkModeUseCase(Get.find()));
    Get.create(() => SaveIsDarkModeUseCase(Get.find()));
    Get.create(() => ClearAllUserInfoUseCase(Get.find()));
    Get.create(() => GetCurrentUserUseCase(Get.find()));
    Get.create(() => GetHasLoginUseCase(Get.find()));
    Get.create(() => LoginUseCase(Get.find()));
    Get.create(() => LogoutUseCase(Get.find()));
    Get.create(() => SaveDeviceTokenUseCase(Get.find()));
  }
}

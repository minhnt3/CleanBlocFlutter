import 'package:domain/domain.dart';
import 'package:get/get.dart';

import '../repository/app_repository_impl.dart';
import '../repository/user_repository_impl.dart';

class RepositoryModule extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppRepository>(() => AppRepositoryImpl(Get.find()));
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find(), Get.find()));
  }
}

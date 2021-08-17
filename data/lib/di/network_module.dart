import '../repository/source/remote/api/error/http_request_exception_mapper.dart';
import '../repository/source/remote/api/services/refresh_token_service.dart';
import '../repository/source/remote/api/services/user_service.dart';
import 'package:get/get.dart';

class NetworkModule extends Bindings {
  @override
  void dependencies() {
    Get.create(() => HttpRequestExceptionMapper(Get.find()));
    Get.lazyPut(() => RefreshTokenService());
    Get.lazyPut(() => UserService());
  }
}

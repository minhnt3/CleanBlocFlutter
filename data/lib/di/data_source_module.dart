import '../repository/source/local/app_local_data_source.dart';
import '../repository/source/local/user_local_data_source.dart';
import '../repository/source/remote/user_remote_data_source.dart';
import 'package:get/get.dart';

class DataSourceModule extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppLocalDataSource(Get.find()));
    Get.lazyPut(
      () => UserLocalDataSource(Get.find(), Get.find()),
    );
    Get.lazyPut(() => UserRemoteDataSource(Get.find(), Get.find(), Get.find()));
  }
}

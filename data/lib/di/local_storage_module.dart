import '../repository/source/local/preference/app_preferences.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageModule extends Bindings {
  @override
  void dependencies() async {
    await Get.putAsync(SharedPreferences.getInstance);
    Get.lazyPut(() => AppPreferences(Get.find()));
  }
}
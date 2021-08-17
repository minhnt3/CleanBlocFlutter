import 'package:core/core.dart';
import 'package:get/get.dart';

class WebAppModule extends Bindings {
  @override
  void dependencies() {
    CoreModule().dependencies();
  }
}

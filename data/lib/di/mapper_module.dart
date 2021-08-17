import '../repository/source/local/preference/model/mapper/preference_user_data_mapper.dart';
import '../repository/source/remote/model/mapper/error_response_detail_mapper.dart';
import '../repository/source/remote/model/mapper/error_response_mapper.dart';
import '../repository/source/remote/model/mapper/remote_image_url_data_mapper.dart';
import '../repository/source/remote/model/mapper/remote_notification_data_mapper.dart';
import '../repository/source/remote/model/mapper/remote_token_data_mapper.dart';
import '../repository/source/remote/model/mapper/remote_user_data_mapper.dart';
import 'package:get/get.dart';

class MapperModule extends Bindings {
  @override
  void dependencies() {
    Get.create(() => PreferenceUserDataMapper());
    Get.create(() => ErrorResponseDetailMapper());
    Get.create(() => ErrorResponseMapper(Get.find()));
    Get.create(() => RemoteImageUrlDataMapper());
    Get.create(() => RemoteNotificationDataMapper());
    Get.create(() => RemoteTokenDataMapper());
    Get.create(() => RemoteUserDataMapper(Get.find()));
  }
}

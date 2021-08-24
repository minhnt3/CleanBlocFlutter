import 'package:flutter/foundation.dart';

import '../data.dart';
import '../repository/source/remote/api/middleware/custom_log_interceptor.dart';

Future<void> config() async {
  /// config http request logging
  HttpRequestLogConfig.enableLogInterceptor = kDebugMode;

  await configureInjection();
}

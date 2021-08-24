library config;

import 'package:data/config/config.dart' as data;
import 'package:domain/di/di.dart' as domain;

Future<void> config() async {
  await data.config();
  await domain.configureInjection();
}
import 'package:core/core.dart' as core;
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BuildConfig.flavor = Flavor.staging;
  setPathUrlStrategy();
  await core.configureInjection();
  await configureInjection();
  runApp(App());
}
